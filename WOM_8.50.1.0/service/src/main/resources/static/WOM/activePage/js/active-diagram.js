"use strict";

(function(options) {
	var funcs = {};

	function subclassOf(baseClass, superClass) {
		baseClass.prototype = Object.create(superClass.prototype);
		baseClass.prototype.$super = superClass.prototype;
	}

	function unnull(/* children */) {
		return [].slice.call(arguments).reduce(function(sofar, x) { return sofar !== undefined ? sofar : x; });
	}

	function determineGaps(outer, inner) {
		var diff = outer - inner;
		switch(ActiveDiagram.INTERNAL_ALIGNMENT) {
			case 'left': return [0, diff]; break;
			case 'right': return [diff, 0]; break;
			case 'center':
			default: return [diff/2, diff/2]; break;
		}
	}

	function wrapString(value) {
		return value instanceof FakeSVG ? value : new Terminal(""+value);
	}

	var SVG = funcs.SVG = function SVG(name, attrs, text) {
		attrs = attrs || {};
		text = text || '';
		var el = document.createElementNS("http://www.w3.org/2000/svg",name);
		for(var attr in attrs) {
			if(attr === 'xlink:href')
				el.setAttributeNS("http://www.w3.org/1999/xlink", 'href', attrs[attr]);
			else
				el.setAttribute(attr, attrs[attr]);
		}
		el.textContent = text;
		return el;
	}

	var FakeSVG = funcs.FakeSVG = function FakeSVG(tagName, attrs, text){
		if(!(this instanceof FakeSVG)) return new FakeSVG(tagName, attrs, text);
		if(text) this.children = text;
		else this.children = [];
		this.tagName = tagName;
		this.attrs = unnull(attrs, {});
		return this;
	};
	FakeSVG.prototype.addTo = function(parent) {
		if(parent instanceof FakeSVG) {
			parent.children.push(this);
			return this;
		} else {
			var svg = this.toSVG();
			parent.appendChild(svg);
			return svg;
		}
	};
	FakeSVG.prototype.attr = function (attr) {
        for (var a in attr) {
            this.attrs[a] = attr[a];
        }

        return this;
    }
    FakeSVG.prototype.click = function (clickFuncs){
	    $(this).on("click",clickFuncs)
	    return this;
    }
	FakeSVG.prototype.escapeString = function(string) {
		return string.replace(/[*_\`\[\]<&]/g, function(charString) {
			return '&#' + charString.charCodeAt(0) + ';';
		});
	};
	FakeSVG.prototype.toSVG = function() {
		var el = SVG(this.tagName, this.attrs);
		if(typeof this.children == 'string') {
			el.textContent = this.children;
		} else {
			this.children.forEach(function(e) {
				el.appendChild(e.toSVG());
			});
		}
		return el;
	};
	FakeSVG.prototype.toString = function() {
		var str = '<' + this.tagName;
		var group = this.tagName == "g" || this.tagName == "svg";
		for(var attr in this.attrs) {
			str += ' ' + attr + '="' + (this.attrs[attr]+'').replace(/&/g, '&amp;').replace(/"/g, '&quot;') + '"';
		}
		str += '>';
		if(group) str += "\n";
		if(typeof this.children == 'string') {
			str += FakeSVG.prototype.escapeString(this.children);
		} else {
			this.children.forEach(function(e) {
				str += e;
			});
		}
		str += '</' + this.tagName + '>\n';
		return str;
	}

	var Path = funcs.Path = function Path(x,y) {
		if(!(this instanceof Path)) return new Path(x,y);
		FakeSVG.call(this, 'path');
		this.attrs.d = "M"+x+' '+y;
	}
	subclassOf(Path, FakeSVG);
	Path.prototype.m = function(x,y) {
		this.attrs.d += 'm'+x+' '+y;
		return this;
	}
	Path.prototype.h = function(val) {
		this.attrs.d += 'h'+val;
		return this;
	}
	Path.prototype.marker_end = function(val) {
		this.attrs['marker-start'] = "url(#"+val+")";
		this.attrs['marker-mid'] = "url(#"+val+")";
		this.attrs['class'] = "marker";
		return this;
	}
	Path.prototype.right = function(val) { return this.h(Math.max(0, val)); }
	Path.prototype.left = function(val) { return this.h(-Math.max(0, val)); }
	Path.prototype.v = function(val) {
		this.attrs.d += 'v'+val;
		return this;
	}
	Path.prototype.down = function(val) { return this.v(Math.max(0, val)); }
	Path.prototype.up = function(val) { return this.v(-Math.max(0, val)); }
	Path.prototype.arc = function(sweep){
		// 1/4 of a circle
		var x = ActiveDiagram.ARC_RADIUS;
		var y = ActiveDiagram.ARC_RADIUS;
		if(sweep[0] == 'e' || sweep[1] == 'w') {
			x *= -1;
		}
		if(sweep[0] == 's' || sweep[1] == 'n') {
			y *= -1;
		}
		if(sweep == 'ne' || sweep == 'es' || sweep == 'sw' || sweep == 'wn') {
			var cw = 1;
		} else {
			var cw = 0;
		}
		this.attrs.d += "a"+ActiveDiagram.ARC_RADIUS+" "+ActiveDiagram.ARC_RADIUS+" 0 0 "+cw+' '+x+' '+y;
		return this;
	}
	Path.prototype.l = function(x, y) {
		this.attrs.d += 'l'+x+' '+y;
		return this;
	}
	Path.prototype.format = function() {
		this.attrs.d += 'h.5';
		return this;
	}

	var ActiveDiagram = funcs.ActiveDiagram = function ActiveDiagram(items) {
		if(!(this instanceof ActiveDiagram)) return new ActiveDiagram([].slice.call(arguments));
		FakeSVG.call(this, 'svg', {class: ActiveDiagram.DIAGRAM_CLASS});
		this.items = items.map(wrapString);
		if(!(this.items[0] instanceof Start)) {
			this.items.unshift(new Start());
		}
		if(!(this.items[this.items.length-1] instanceof End)) {
			this.items.push(new End());
		}
		this.up = this.down = this.height = this.width = 0;
		for(var i = 0; i < this.items.length; i++) {
			var item = this.items[i];
			this.width += item.width + (item.needsSpace?20:0);
			this.up = Math.max(this.up, item.up - this.height);
			this.height += item.height;
			this.down = Math.max(this.down - item.height, item.down);
		}
		this.formatted = false;
	}
	subclassOf(ActiveDiagram, FakeSVG);
	for(var option in options) {
		ActiveDiagram[option] = options[option];
	}
	ActiveDiagram.prototype.format = function(paddingt, paddingr, paddingb, paddingl) {
		paddingt = unnull(paddingt, 20);
		paddingr = unnull(paddingr, paddingt, 20);
		paddingb = unnull(paddingb, paddingt, 20);
		paddingl = unnull(paddingl, paddingr, 20);
		var x = paddingl;
		var y = paddingt;
		y += this.up;
		var g = FakeSVG('g', ActiveDiagram.STROKE_ODD_PIXEL_LENGTH ? {transform:'translate(.5 .5)'} : {});
		for(var i = 0; i < this.items.length; i++) {
			var item = this.items[i];
			if(item.needsSpace) {
				Path(x,y).h(10).addTo(g);
				x += 10;
			}
			item.format(x, y, item.width).addTo(g);
			x += item.width;
			y += item.height;
			if(item.needsSpace) {
				Path(x,y).h(10).addTo(g);
				x += 10;
			}
		}
		this.attrs.width = this.width + paddingl + paddingr;
		this.attrs.height = this.up + this.height + this.down + paddingt + paddingb;
		this.attrs.viewBox = "0 0 " + this.attrs.width + " " + this.attrs.height;
		g.addTo(this);
		this.formatted = true;
		return this;
	}
	ActiveDiagram.prototype.addTo = function(parent) {
		if(!parent) {
			var scriptTag = document.getElementsByTagName('script');
			scriptTag = scriptTag[scriptTag.length - 1];
			parent = scriptTag.parentNode;
		}
		return this.$super.addTo.call(this, parent);
	}
	ActiveDiagram.prototype.toSVG = function() {
		if (!this.formatted) {
			this.format();
		}
		return this.$super.toSVG.call(this);
	}
	ActiveDiagram.prototype.toString = function() {
		if (!this.formatted) {
			this.format();
		}
		return this.$super.toString.call(this);
	}
	ActiveDiagram.DEBUG = false;

	var Sequence = funcs.Sequence = function Sequence(items) {
		if(!(this instanceof Sequence)) return new Sequence([].slice.call(arguments));
		FakeSVG.call(this, 'g');
		this.items = items.map(wrapString);
		var numberOfItems = this.items.length;
		this.needsSpace = true;
		this.up = this.down = this.height = this.width = 0;
		for(var i = 0; i < this.items.length; i++) {
			var item = this.items[i];
			this.width += item.width + (item.needsSpace?20:0);
			this.up = Math.max(this.up, item.up - this.height);
			this.height += item.height;
			this.down = Math.max(this.down - item.height, item.down);
		}
		if(this.items[0] && this.items[0].needsSpace) this.width -= 10;
		if(this.items[this.items.length-1].needsSpace) this.width -= 10;
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down
			this.attrs['data-type'] = "sequence"
		}
	}
	subclassOf(Sequence, FakeSVG);
	Sequence.prototype.format = function(x,y,width) {
		var gaps = determineGaps(width, this.width);
		Path(x,y).h(gaps[0]).addTo(this);
		Path(x+gaps[0]+this.width,y+this.height).h(gaps[1]).addTo(this);
		x += gaps[0];

		for(var i = 0; i < this.items.length; i++) {
			var item = this.items[i];
			if(item.needsSpace && i > 0) {
				Path(x,y).h(10).addTo(this);
				x += 10;
			}
			item.format(x, y, item.width).addTo(this);
			x += item.width;
			y += item.height;
			if(item.needsSpace && i < this.items.length-1) {
				Path(x,y).h(10).addTo(this);
				x += 10;
			}
		}
		return this;
	}

	var Stack = funcs.Stack = function Stack(items) {
		if(!(this instanceof Stack)) return new Stack([].slice.call(arguments));
		FakeSVG.call(this, 'g');
		if( items.length === 0 ) {
			throw new RangeError("Stack() 至少有一个子节点");
		}
		this.items = items.map(wrapString);
		this.width = Math.max.apply(null, this.items.map(function(e) { return e.width + (e.needsSpace?20:0); }));
		if(this.items.length > 1){
			this.width += ActiveDiagram.ARC_RADIUS*2;
		}
		this.needsSpace = true;
		this.up = this.items[0].up;
		this.down = this.items[this.items.length-1].down;

		this.height = 0;
		var last = this.items.length - 1;
		for(var i = 0; i < this.items.length; i++) {
			var item = this.items[i];
			this.height += item.height;
			if(i > 0) {
				this.height += Math.max(ActiveDiagram.ARC_RADIUS*2, item.up + ActiveDiagram.VERTICAL_SEPARATION);
			}
			if(i < last) {
				this.height += Math.max(ActiveDiagram.ARC_RADIUS*2, item.down + ActiveDiagram.VERTICAL_SEPARATION);
			}
		}
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down
			this.attrs['data-type'] = "stack"
		}
	}
	subclassOf(Stack, FakeSVG);
	Stack.prototype.format = function(x,y,width) {
		var gaps = determineGaps(width, this.width);
		Path(x,y).h(gaps[0]).addTo(this);
		x += gaps[0];
		var xInitial = x;
		if(this.items.length > 1) {
			Path(x, y).h(ActiveDiagram.ARC_RADIUS).addTo(this);
			x += ActiveDiagram.ARC_RADIUS;
		}

		for(var i = 0; i < this.items.length; i++) {
			var item = this.items[i];
			var innerWidth = this.width - (this.items.length>1 ? ActiveDiagram.ARC_RADIUS*2 : 0);
			item.format(x, y, innerWidth).addTo(this);
			x += innerWidth;
			y += item.height;

			if(i !== this.items.length-1) {
				Path(x, y).marker_end("arrow")
					.arc('ne').down(Math.max(0, item.down + ActiveDiagram.VERTICAL_SEPARATION - ActiveDiagram.ARC_RADIUS*2))
					.arc('es').left(innerWidth)
					.arc('nw').down(Math.max(0, this.items[i+1].up + ActiveDiagram.VERTICAL_SEPARATION - ActiveDiagram.ARC_RADIUS*2))
					.arc('ws').addTo(this);
				y += Math.max(item.down + ActiveDiagram.VERTICAL_SEPARATION, ActiveDiagram.ARC_RADIUS*2) + Math.max(this.items[i+1].up + ActiveDiagram.VERTICAL_SEPARATION, ActiveDiagram.ARC_RADIUS*2);
				x = xInitial+ActiveDiagram.ARC_RADIUS;
			}

		}

		if(this.items.length > 1) {
			Path(x,y).h(ActiveDiagram.ARC_RADIUS).addTo(this);
			x += ActiveDiagram.ARC_RADIUS;
		}
		Path(x,y).h(gaps[1]).addTo(this);

		return this;
	}

	var Choice = funcs.Choice = function Choice(normal, items) {
		if(!(this instanceof Choice)) return new Choice(normal, [].slice.call(arguments,1));
		FakeSVG.call(this, 'g');
		if( typeof normal !== "number" || normal !== Math.floor(normal) ) {
			throw new TypeError("Choice第一个参数必须是数字");
		} else if(normal < 0 || normal >= items.length) {
		} else {
			this.normal = normal;
		}
		var first = 0;
		var last = items.length - 1;
		this.items = items.map(wrapString);
		this.width = Math.max.apply(null, this.items.map(function(el){return el.width})) + ActiveDiagram.ARC_RADIUS*4;
		this.height = this.items[normal].height;
		this.up = this.items[first].up;
		for(var i = first; i < normal; i++) {
			if(i == normal-1) var arcs = ActiveDiagram.ARC_RADIUS*2;
			else var arcs = ActiveDiagram.ARC_RADIUS;
			this.up += Math.max(arcs, this.items[i].height + this.items[i].down + ActiveDiagram.VERTICAL_SEPARATION + this.items[i+1].up);
		}
		this.down = this.items[last].down;
		for(var i = normal+1; i <= last; i++) {
			if(i == normal+1) var arcs = ActiveDiagram.ARC_RADIUS*2;
			else var arcs = ActiveDiagram.ARC_RADIUS;
			this.down += Math.max(arcs, this.items[i-1].height + this.items[i-1].down + ActiveDiagram.VERTICAL_SEPARATION + this.items[i].up);
		}
		this.down -= this.items[normal].height; // 已经计算好的高度
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down
			this.attrs['data-type'] = "choice"
		}
	}
	subclassOf(Choice, FakeSVG);
	Choice.prototype.format = function(x,y,width) {
		var gaps = determineGaps(width, this.width);
		Path(x,y).h(gaps[0]).addTo(this);
		Path(x+gaps[0]+this.width,y+this.height).h(gaps[1]).addTo(this);
		x += gaps[0];

		var last = this.items.length -1;
		var innerWidth = this.width - ActiveDiagram.ARC_RADIUS*4;

		// Do the elements that curve above
		for(var i = this.normal - 1; i >= 0; i--) {
			var item = this.items[i];
			if( i == this.normal - 1 ) {
				var distanceFromY = Math.max(ActiveDiagram.ARC_RADIUS*2, this.items[this.normal].up + ActiveDiagram.VERTICAL_SEPARATION + item.down + item.height);
			}
			Path(x,y)
				.arc('se')
				.up(distanceFromY - ActiveDiagram.ARC_RADIUS*2)
				.arc('wn').addTo(this);
			item.format(x+ActiveDiagram.ARC_RADIUS*2,y - distanceFromY,innerWidth).addTo(this);
			Path(x+ActiveDiagram.ARC_RADIUS*2+innerWidth, y-distanceFromY+item.height)
				.arc('ne')
				.down(distanceFromY - item.height + this.height - ActiveDiagram.ARC_RADIUS*2)
				.arc('ws').addTo(this);
			distanceFromY += Math.max(ActiveDiagram.ARC_RADIUS, item.up + ActiveDiagram.VERTICAL_SEPARATION + (i == 0 ? 0 : this.items[i-1].down+this.items[i-1].height));
		}

		Path(x,y).right(ActiveDiagram.ARC_RADIUS*2).addTo(this);
		this.items[this.normal].format(x+ActiveDiagram.ARC_RADIUS*2, y, innerWidth).addTo(this);
		Path(x+ActiveDiagram.ARC_RADIUS*2+innerWidth, y+this.height).right(ActiveDiagram.ARC_RADIUS*2).addTo(this);

		for(var i = this.normal+1; i <= last; i++) {
			var item = this.items[i];
			if( i == this.normal + 1 ) {
				var distanceFromY = Math.max(ActiveDiagram.ARC_RADIUS*2, this.height + this.items[this.normal].down + ActiveDiagram.VERTICAL_SEPARATION + item.up);
			}
			Path(x,y)
				.arc('ne')
				.down(distanceFromY - ActiveDiagram.ARC_RADIUS*2)
				.arc('ws').addTo(this);
			item.format(x+ActiveDiagram.ARC_RADIUS*2, y+distanceFromY, innerWidth).addTo(this);
			Path(x+ActiveDiagram.ARC_RADIUS*2+innerWidth, y+distanceFromY+item.height)
				.arc('se')
				.up(distanceFromY - ActiveDiagram.ARC_RADIUS*2 + item.height - this.height)
				.arc('wn').addTo(this);
			distanceFromY += Math.max(ActiveDiagram.ARC_RADIUS, item.height + item.down + ActiveDiagram.VERTICAL_SEPARATION + (i == last ? 0 : this.items[i+1].up));
		}

		return this;
	}

	var Start = funcs.Start = function Start({type="simple", label}={}) {
		if(!(this instanceof Start)) return new Start({type, label});
		FakeSVG.call(this, 'g');
		this.width = 20;
		this.height = 0;
		this.up = 10;
		this.down = 10;
		this.type = type;
		if(label != undefined) {
			this.label = ""+label;
			this.width = Math.max(20, this.label.length * ActiveDiagram.CHAR_WIDTH + 10);
		}
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down
			this.attrs['data-type'] = "start"
		}
	}
	subclassOf(Start, FakeSVG);
	Start.prototype.format = function(x,y) {
		let path = new Path(x, y-10);
		if (this.type === "complex") {
			path.down(20)
				.m(0, -10)
				.right(this.width)
				.addTo(this);
		} else {
			path.down(20)
				.m(10, -20)
				.down(20)
				.m(-10, -10)
				.right(this.width)
				.addTo(this);
		}
		if(this.label) {
			new FakeSVG('text', {x:x, y:y-15, style:"text-anchor:start"}, this.label).addTo(this);
		}
		return this;
	}

	var End = funcs.End = function End({type="simple"}={}) {
		if(!(this instanceof End)) return new End({type});
		FakeSVG.call(this, 'path');
		this.width = 20;
		this.height = 0;
		this.up = 10;
		this.down = 10;
		this.type = type;
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down
			this.attrs['data-type'] = "end"
		}
	}
	subclassOf(End, FakeSVG);
	End.prototype.format = function(x,y) {
		if (this.type === "complex") {
			this.attrs.d = 'M '+x+' '+y+' h 20 m 0 -10 v 20';
		} else {
			this.attrs.d = 'M '+x+' '+y+' h 20 m -10 -10 v 20 m 10 -20 v 20';
		}
		return this;
	}

	var Terminal = funcs.Terminal = function Terminal(text, {href, title,data}={}) {
		if(!(this instanceof Terminal)) return new Terminal(text, {href, title,data});
		FakeSVG.call(this, 'g', {'class': 'terminal'});
		this.data = data;
		this.text = ""+text;
		this.href = href;
		this.title = title;
		this.width = this.text.length * ActiveDiagram.CHAR_WIDTH * 2 + 20;
		this.height = 0;
		this.up = 11;
		this.down = 11;
		
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down
			this.attrs['data-type'] = "terminal"
		}
	}
	subclassOf(Terminal, FakeSVG);
	Terminal.prototype.needsSpace = true;
	Terminal.prototype.format = function(x, y, width) {
		var gaps = determineGaps(width, this.width);
		Path(x,y).h(gaps[0]).addTo(this);
		Path(x+gaps[0]+this.width,y).h(gaps[1]).addTo(this);
		x += gaps[0];

		let jsonData = JSON.parse(this.data),attr = {};
		
		if (jsonData.status == "step-done") { //活动已完成
			attr["fill"] = "rgb(201, 224, 242)";
			attr["stroke"] = "rgb(72, 130, 216)";
		}else if (jsonData.status == "step-doing") { //活动正在进行
			attr["fill"] = "rgb(208, 226, 210)";
			attr["stroke"] = "rgb(79, 157, 79)";
		}else { //活动未开始
			attr["fill"] = "rgb(239, 219, 211)";
			attr["stroke"] = "rgb(209, 84, 0)";
		}
		
		FakeSVG('rect', {x:x, y:y-11, width:this.width, height:this.up+this.down, rx:10, ry:10}).attr(attr).click(function () {
            console.log(1212)
        }).addTo(this);
		var text = FakeSVG('text', {x:x+this.width/2, y:y+4}, this.text);
		if(this.href || this.data)
			FakeSVG('a', {'xlink:href': this.href,'data' : this.data}, [text]).addTo(this);
		else
			text.addTo(this);
		if(this.title)
			new FakeSVG('title', {}, this.title).addTo(this);
		return this;
	}

	var Block = funcs.Block = function Block({width=50, up=15, height=25, down=15, needsSpace=true}={}) {
		if(!(this instanceof Block)) return new Block({width, up, height, down, needsSpace});
		FakeSVG.call(this, 'g');
		this.width = width;
		this.height = height;
		this.up = up;
		this.down = down;
		this.needsSpace = true;
		if(ActiveDiagram.DEBUG) {
			this.attrs['data-updown'] = this.up + " " + this.height + " " + this.down;
			this.attrs['data-type'] = "block"
		}
	}
	subclassOf(Block, FakeSVG);
	Block.prototype.format = function(x, y, width) {
		var gaps = determineGaps(width, this.width);
		new Path(x,y).h(gaps[0]).addTo(this);
		new Path(x+gaps[0]+this.width,y).h(gaps[1]).addTo(this);
		x += gaps[0];

		new FakeSVG('rect', {x:x, y:y-this.up, width:this.width, height:this.up+this.height+this.down}).addTo(this);
		return this;
	}

	var root;
	if (typeof define === 'function' && define.amd) {
		root = {};
		define([], function() {
			return root;
		});
	}else {
		root = this;
	}

	for(var name in funcs) {
		root[name] = funcs[name];
	}
}).call(this,
	{
	VERTICAL_SEPARATION: 8,
	ARC_RADIUS: 8,
	DIAGRAM_CLASS: 'railroad-diagram',
	STROKE_ODD_PIXEL_LENGTH: true,
	INTERNAL_ALIGNMENT: 'center',
	CHAR_WIDTH: 8.5, // 字符宽度
	COMMENT_CHAR_WIDTH: 7, // 文本框最低宽度
	}
);
