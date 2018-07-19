(function() { var ba = "function" == typeof Object.create ? Object.create : function(a) { var b = function() {};
			b.prototype = a; return new b },
		ca; if("function" == typeof Object.setPrototypeOf) ca = Object.setPrototypeOf;
	else { var da;
		a: { var ea = { a: !0 },
				fa = {}; try { fa.__proto__ = ea;
				da = fa.a; break a } catch(a) {} da = !1 } ca = da ? function(a, b) { a.__proto__ = b; if(a.__proto__ !== b) throw new TypeError(a + " is not extensible"); return a } : null } var ha = ca,
		ia = function(a, b) { a.prototype = ba(b.prototype);
			a.prototype.constructor = a; if(ha) ha(a, b);
			else
				for(var c in b)
					if("prototype" != c)
						if(Object.defineProperties) { var d = Object.getOwnPropertyDescriptor(b, c);
							d && Object.defineProperty(a, c, d) } else a[c] = b[c];
			a.Ba = b.prototype },
		ja = "function" == typeof Object.defineProperties ? Object.defineProperty : function(a, b, c) { a != Array.prototype && a != Object.prototype && (a[b] = c.value) },
		ka = "undefined" != typeof window && window === this ? this : "undefined" != typeof global && null != global ? global : this,
		la = function(a, b) { if(b) { var c = ka;
				a = a.split("."); for(var d = 0; d < a.length - 1; d++) { var e = a[d];
					e in c || (c[e] = {});
					c = c[e] } a = a[a.length - 1];
				d = c[a];
				b = b(d);
				b != d && null != b && ja(c, a, { configurable: !0, writable: !0, value: b }) } };
	la("String.prototype.endsWith", function(a) { return a ? a : function(a, c) { if(null == this) throw new TypeError("The 'this' value for String.prototype.endsWith must not be null or undefined"); if(a instanceof RegExp) throw new TypeError("First argument to String.prototype.endsWith must not be a regular expression");
			void 0 === c && (c = this.length);
			c = Math.max(0, Math.min(c | 0, this.length)); for(var b = a.length; 0 < b && 0 < c;)
				if(this[--c] != a[--b]) return !1; return 0 >= b } });
	la("Number.isNaN", function(a) { return a ? a : function(a) { return "number" === typeof a && isNaN(a) } }); var n = this,
		ma = function(a) { return "string" == typeof a },
		na = function(a) { return "boolean" == typeof a },
		u = function(a) { return "number" == typeof a },
		oa = /^[\w+/_-]+[=]{0,2}$/,
		pa = null,
		qa = function() {},
		ra = function(a) { var b = typeof a; if("object" == b)
				if(a) { if(a instanceof Array) return "array"; if(a instanceof Object) return b; var c = Object.prototype.toString.call(a); if("[object Window]" == c) return "object"; if("[object Array]" == c || "number" == typeof a.length && "undefined" != typeof a.splice && "undefined" != typeof a.propertyIsEnumerable && !a.propertyIsEnumerable("splice")) return "array"; if("[object Function]" == c || "undefined" != typeof a.call && "undefined" != typeof a.propertyIsEnumerable && !a.propertyIsEnumerable("call")) return "function" } else return "null";
			else if("function" == b && "undefined" == typeof a.call) return "object"; return b },
		sa = function(a) { return "function" == ra(a) },
		ta = function(a) { var b = typeof a; return "object" == b && null != a || "function" == b },
		ua = function(a, b, c) { return a.call.apply(a.bind, arguments) },
		va = function(a, b, c) { if(!a) throw Error(); if(2 < arguments.length) { var d = Array.prototype.slice.call(arguments, 2); return function() { var c = Array.prototype.slice.call(arguments);
					Array.prototype.unshift.apply(c, d); return a.apply(b, c) } } return function() { return a.apply(b, arguments) } },
		wa = function(a, b, c) { Function.prototype.bind && -1 != Function.prototype.bind.toString().indexOf("native code") ? wa = ua : wa = va; return wa.apply(null, arguments) },
		xa = function(a, b) { var c = Array.prototype.slice.call(arguments, 1); return function() { var b = c.slice();
				b.push.apply(b, arguments); return a.apply(this, b) } },
		ya = function(a, b) {
			function c() {} c.prototype = b.prototype;
			a.Ba = b.prototype;
			a.prototype = new c;
			a.prototype.constructor = a;
			a.Ia = function(a, c, f) { for(var d = Array(arguments.length - 2), e = 2; e < arguments.length; e++) d[e - 2] = arguments[e]; return b.prototype[c].apply(a, d) } }; var za = (new Date).getTime(); var Aa = function(a, b) { if(ma(a)) return ma(b) && 1 == b.length ? a.indexOf(b, 0) : -1; for(var c = 0; c < a.length; c++)
				if(c in a && a[c] === b) return c; return -1 },
		Ba = function(a, b) { for(var c = a.length, d = ma(a) ? a.split("") : a, e = 0; e < c; e++) e in d && b.call(void 0, d[e], e, a) },
		Ca = function(a) { return Array.prototype.concat.apply([], arguments) }; var Da = function(a) { return /^[\s\xa0]*([\s\S]*?)[\s\xa0]*$/.exec(a)[1] },
		La = function(a) { if(!Ea.test(a)) return a; - 1 != a.indexOf("&") && (a = a.replace(Fa, "&amp;")); - 1 != a.indexOf("<") && (a = a.replace(Ga, "&lt;")); - 1 != a.indexOf(">") && (a = a.replace(Ha, "&gt;")); - 1 != a.indexOf('"') && (a = a.replace(Ia, "&quot;")); - 1 != a.indexOf("'") && (a = a.replace(Ja, "&#39;")); - 1 != a.indexOf("\x00") && (a = a.replace(Ka, "&#0;")); return a },
		Fa = /&/g,
		Ga = /</g,
		Ha = />/g,
		Ia = /"/g,
		Ja = /'/g,
		Ka = /\x00/g,
		Ea = /[\x00&<>"']/,
		Ma = { "\x00": "\\0", "\b": "\\b", "\f": "\\f", "\n": "\\n", "\r": "\\r", "\t": "\\t", "\x0B": "\\x0B", '"': '\\"', "\\": "\\\\", "<": "<" },
		Na = { "'": "\\'" },
		v = function(a, b) { return -1 != a.indexOf(b) },
		Oa = function(a) { return String(a).replace(/\-([a-z])/g, function(a, c) { return c.toUpperCase() }) }; var w;
	a: { var Pa = n.navigator; if(Pa) { var Qa = Pa.userAgent; if(Qa) { w = Qa; break a } } w = "" }; var Ra = function(a, b) { for(var c in a)
			if(b.call(void 0, a[c], c, a)) return c }; var Sa = function(a) { Sa[" "](a); return a };
	Sa[" "] = qa; var x = function() {},
		Ta = "function" == typeof Uint8Array,
		Wa = function(a, b, c) { a.j = null;
			b || (b = []);
			a.F = void 0;
			a.s = -1;
			a.l = b;
			a: { if(a.l.length) { b = a.l.length - 1; var d = a.l[b]; if(d && "object" == typeof d && "array" != ra(d) && !(Ta && d instanceof Uint8Array)) { a.v = b - a.s;
						a.m = d; break a } } a.v = Number.MAX_VALUE } a.C = {}; if(c)
				for(b = 0; b < c.length; b++) d = c[b], d < a.v ? (d += a.s, a.l[d] = a.l[d] || Ua) : (Va(a), a.m[d] = a.m[d] || Ua) },
		Ua = [],
		Va = function(a) { var b = a.v + a.s;
			a.l[b] || (a.m = a.l[b] = {}) },
		y = function(a, b) { if(b < a.v) { b += a.s; var c = a.l[b]; return c === Ua ? a.l[b] = [] : c } if(a.m) return c = a.m[b], c === Ua ? a.m[b] = [] : c },
		Xa = function(a, b) { if(b < a.v) { b += a.s; var c = a.l[b]; return c === Ua ? a.l[b] = [] : c } c = a.m[b]; return c === Ua ? a.m[b] = [] : c },
		Ya = function(a, b) { a = y(a, b); return null == a ? !1 : a },
		Za = function(a, b, c) { a.j || (a.j = {}); if(!a.j[c]) { var d = y(a, c);
				d && (a.j[c] = new b(d)) } return a.j[c] },
		$a = function(a, b, c) { a.j || (a.j = {}); if(!a.j[c]) { for(var d = Xa(a, c), e = [], f = 0; f < d.length; f++) e[f] = new b(d[f]);
				a.j[c] = e } b = a.j[c];
			b == Ua && (b = a.j[c] = []); return b },
		ab = function(a) { if(a.j)
				for(var b in a.j) { var c = a.j[b]; if("array" == ra(c))
						for(var d = 0; d < c.length; d++) c[d] && ab(c[d]);
					else c && ab(c) } };
	x.prototype.toString = function() { ab(this); return this.l.toString() }; var bb = document,
		z = window; var cb = { "120x90": !0, "160x90": !0, "180x90": !0, "200x90": !0, "468x15": !0, "728x15": !0 },
		db = function(a, b) { if(15 == b) { if(728 <= a) return 728; if(468 <= a) return 468 } else if(90 == b) { if(200 <= a) return 200; if(180 <= a) return 180; if(160 <= a) return 160; if(120 <= a) return 120 } return null }; var fb = function() { this.l = "";
		this.m = eb };
	fb.prototype.la = !0;
	fb.prototype.j = function() { return this.l }; var gb = function(a) { if(a instanceof fb && a.constructor === fb && a.m === eb) return a.l;
			ra(a); return "type_error:TrustedResourceUrl" },
		eb = {}; var ib = function() { this.$ = "";
		this.sa = hb };
	ib.prototype.la = !0;
	ib.prototype.j = function() { return this.$ }; var jb = /^(?:(?:https?|mailto|ftp):|[^:/?#]*(?:[/?#]|$))/i,
		hb = {},
		kb = function(a) { var b = new ib;
			b.$ = a; return b };
	kb("about:blank"); var lb = function(a, b) { a.src = gb(b); if(null === pa) { a: { if((b = n.document.querySelector("script[nonce]")) && (b = b.nonce || b.getAttribute("nonce")) && oa.test(b)) break a;b = null } pa = b || "" } if(b = pa) a.nonce = b }; var mb = function(a) { this.j = a || n.document || document },
		nb = function(a, b) { return a.j.createElement(String(b)) }; var ob = function(a) { var b = !1,
				c; return function() { b || (c = a(), b = !0); return c } },
		pb = function() { var a = qa; return function() { if(a) { var b = a;
					a = null;
					b() } } }; var rb = function(a) { qb(); var b = new fb;
			b.l = a; return b },
		qb = qa; var sb = /^[\w+/_-]+[=]{0,2}$/,
		tb = function() { var a = n.document.querySelector("script[nonce]"); if(a && (a = a.nonce || a.getAttribute("nonce")) && sb.test(a)) return a }; var A = function(a) { try { var b; if(b = !!a && null != a.location.href) a: { try { Sa(a.foo);
						b = !0; break a } catch(c) {} b = !1 }
				return b } catch(c) { return !1 } },
		vb = function(a) { for(var b = n, c = 0; b && 40 > c++ && (!A(b) || !a(b));) b = ub(b) },
		wb = function() { var a = n;
			vb(function(b) { a = b; return !1 }); return a },
		ub = function(a) { try { var b = a.parent; if(b && b != a) return b } catch(c) {} return null },
		xb = function(a, b) { var c = [n.top],
				d = [],
				e = 0;
			b = b || 1024; for(var f; f = c[e++];) { a && !A(f) || d.push(f); try { if(f.frames)
						for(var g = f.frames.length, h = 0; h < g && c.length < b; ++h) c.push(f.frames[h]) } catch(l) {} } return d },
		B = function(a, b) { return b.getComputedStyle ? b.getComputedStyle(a, null) : a.currentStyle },
		yb = function(a) { if(!a.crypto) return Math.random(); try { var b = new Uint32Array(1);
				a.crypto.getRandomValues(b); return b[0] / 65536 / 65536 } catch(c) { return Math.random() } },
		zb = function(a, b) { if(a)
				for(var c in a) Object.prototype.hasOwnProperty.call(a, c) && b.call(void 0, a[c], c, a) },
		Ab = function(a) { var b = a.length; if(0 == b) return 0; for(var c = 305419896, d = 0; d < b; d++) c ^= (c << 5) + (c >> 2) + a.charCodeAt(d) & 4294967295; return 0 < c ? c : 4294967296 + c },
		Bb = ob(function() { return v(w, "Google Web Preview") || 1E-4 > Math.random() }),
		Cb = /^([0-9.]+)px$/,
		Db = /^(-?[0-9.]{1,30})$/,
		Eb = function(a) { return Db.test(a) && (a = Number(a), !isNaN(a)) ? a : null },
		Fb = function(a, b) { return b ? !/^false$/.test(a) : /^true$/.test(a) },
		C = function(a) { return(a = Cb.exec(a)) ? +a[1] : null },
		Gb = function(a, b) { try { return !(!a.frames || !a.frames[b]) } catch(c) { return !1 } },
		Hb = function(a) { var b = wb(); if(b && b.frames && !b.frames[a]) try { var c = b.document,
					d = new mb(c),
					e = c.body || c.head && c.head.parentElement; if(e) { var f = nb(d, "IFRAME");
					f.name = a;
					f.id = a;
					f.setAttribute("style", "display:none;position:fixed;left:-999px;top:-999px;width:0px;height:0px;");
					e.appendChild(f) } } catch(g) {} },
		Ib = function(a) {
			(a = wb().document.getElementById(a)) && a.parentNode && a.parentNode.removeChild(a) },
		Jb = function(a) { for(var b = 0, c = 0; 100 > c && a; c++) b += a.offsetLeft + a.clientLeft - a.scrollLeft, a = a.offsetParent; return b }; var Kb = function(a, b) { a = parseInt(a, 10); return isNaN(a) ? b : a },
		Lb = /^([\w-]+\.)*([\w-]{2,})(:[0-9]+)?$/,
		Mb = function(a, b) { return a ? (a = a.match(Lb)) ? a[0] : b : b }; var Nb = Kb("468", 0); var Ob = function() { return "r20180425" },
		Pb = Fb("false", !1),
		Qb = Fb("true", !1),
		Rb = Fb("true", !1),
		Sb = Rb || !Qb; var Tb = function() { return Mb("", "googleads.g.doubleclick.net") }; var Ub = function(a, b, c) { a.addEventListener ? a.addEventListener(b, c, void 0) : a.attachEvent && a.attachEvent("on" + b, c) },
		Vb = function(a, b, c) { a.removeEventListener ? a.removeEventListener(b, c, void 0) : a.detachEvent && a.detachEvent("on" + b, c) }; var Wb = function(a) { a = void 0 === a ? n : a; var b = a.context; if(!b) try { b = a.parent.context } catch(c) {}
			try { if(b && b.pageViewId && b.canonicalUrl) return b } catch(c) {} return null },
		Xb = function(a) { return(a = a || Wb()) ? A(a.master) ? a.master : null : null }; var Yb = function(a, b) { var c = !1,
			d = !1;
		d = void 0 === d ? !1 : d;
		c = void 0 === c ? !1 : c;
		n.google_image_requests || (n.google_image_requests = []); var e = n.document.createElement("img"); if(b || c) { var f = function(a) { b && b(a); if(c) { a = n.google_image_requests; var d = Aa(a, e);
					0 <= d && Array.prototype.splice.call(a, d, 1) } Vb(e, "load", f);
				Vb(e, "error", f) };
			Ub(e, "load", f);
			Ub(e, "error", f) } d && (e.referrerPolicy = "no-referrer");
		e.src = a;
		n.google_image_requests.push(e) }; var Zb = Object.prototype.hasOwnProperty,
		$b = function(a, b) { for(var c in a) Zb.call(a, c) && b.call(void 0, a[c], c, a) },
		ac = function(a) { return !(!a || !a.call) && "function" === typeof a },
		bc = function(a, b) { for(var c = 1, d = arguments.length; c < d; ++c) a.push(arguments[c]) },
		cc = function(a, b) { if(a.indexOf) return a = a.indexOf(b), 0 < a || 0 === a; for(var c = 0; c < a.length; c++)
				if(a[c] === b) return !0; return !1 },
		dc = function(a) { a = Xb(Wb(a)) || a;
			a.google_unique_id ? ++a.google_unique_id : a.google_unique_id = 1 },
		ec = function(a) { a = Xb(Wb(a)) || a;
			a = a.google_unique_id; return "number" === typeof a ? a : 0 },
		fc = !!window.google_async_iframe_id,
		gc = fc && window.parent || window,
		hc = function() { if(fc && !A(gc)) { var a = "." + bb.domain; try { for(; 2 < a.split(".").length && !A(gc);) bb.domain = a = a.substr(a.indexOf(".") + 1), gc = window.parent } catch(b) {} A(gc) || (gc = window) } return gc },
		ic = /(^| )adsbygoogle($| )/,
		jc = function(a) { a = Pb && a.google_top_window || a.top; return A(a) ? a : null }; var D = function(a, b) { a = a.google_ad_modifications; return cc(a ? a.eids || [] : [], b) },
		E = function(a, b) { a = a.google_ad_modifications; return cc(a ? a.loeids || [] : [], b) },
		kc = function(a, b) { a = a.google_ad_modifications = a.google_ad_modifications || {};
			(a.tag_partners = a.tag_partners || []).push(b) },
		lc = function(a, b, c) { if(!a) return null; for(var d = 0; d < a.length; ++d)
				if((a[d].ad_slot || b) == b && (a[d].ad_tag_origin || c) == c) return a[d]; return null }; var mc = { overlays: 1, interstitials: 2, vignettes: 2, inserts: 3, immersives: 4, list_view: 5, full_page: 6 },
		nc = { Da: { name: "adFormat", B: u }, Ca: { name: "adClient", B: /^[a-z0-9-]+$/i }, Ea: { name: "adTest", B: /^on$/i }, Ha: { name: "reqSrc", B: u }, Ga: { name: "pubVars", B: null }, AD_KEY: { name: "adKey", B: u }, Fa: { name: "enabledInAsfe", B: na } },
		oc = [{ name: "google_ad_channel", B: { predicate: /^[a-z0-9_-]+$/i, nullOnInvalid: !0 } }, { name: "google_reactive_sra_index", B: { predicate: u, nullOnInvalid: !0 } }, { name: "google_ad_unit_key", B: { predicate: u, nullOnInvalid: !0 } }]; var qc = function(a) { Wa(this, a, pc) };
	ya(qc, x); var pc = [4],
		rc = function(a) { Wa(this, a, null) };
	ya(rc, x); var sc = function(a) { Wa(this, a, null) };
	ya(sc, x); var uc = function(a) { Wa(this, a, tc) };
	ya(uc, x); var tc = [6, 7, 9, 10]; var wc = function(a) { Wa(this, a, vc) };
	ya(wc, x); var vc = [1, 2, 5, 7],
		xc = function(a) { Wa(this, a, null) };
	ya(xc, x); var zc = function(a) { Wa(this, a, yc) };
	ya(zc, x); var yc = [2]; var Ac = function(a, b, c) { c = void 0 === c ? {} : c;
		this.error = a;
		this.context = b.context;
		this.line = b.line || -1;
		this.msg = b.message || "";
		this.file = b.file || "";
		this.id = b.id || "jserror";
		this.meta = c }; var Bc = /^https?:\/\/(\w|-)+\.cdn\.ampproject\.(net|org)(\?|\/|$)/,
		Cc = function(a, b) { this.j = a;
			this.l = b },
		Dc = function(a, b, c) { this.url = a;
			this.j = b;
			this.ma = !!c;
			this.depth = u(void 0) ? void 0 : null }; var Ec = function() { this.m = "&";
			this.s = !1;
			this.l = {};
			this.v = 0;
			this.j = [] },
		Fc = function(a, b) { var c = {};
			c[a] = b; return [c] },
		Hc = function(a, b, c, d, e) { var f = [];
			zb(a, function(a, h) {
				(a = Gc(a, b, c, d, e)) && f.push(h + "=" + a) }); return f.join(b) },
		Gc = function(a, b, c, d, e) { if(null == a) return "";
			b = b || "&";
			c = c || ",$"; "string" == typeof c && (c = c.split("")); if(a instanceof Array) { if(d = d || 0, d < c.length) { for(var f = [], g = 0; g < a.length; g++) f.push(Gc(a[g], b, c, d + 1, e)); return f.join(c[d]) } } else if("object" == typeof a) return e = e || 0, 2 > e ? encodeURIComponent(Hc(a, b, c, d, e + 1)) : "..."; return encodeURIComponent(String(a)) },
		Ic = function(a, b, c, d) { a.j.push(b);
			a.l[b] = Fc(c, d) },
		Kc = function(a, b, c, d) { b = b + "//" + c + d; var e = Jc(a) - d.length; if(0 > e) return "";
			a.j.sort(function(a, b) { return a - b });
			d = null;
			c = ""; for(var f = 0; f < a.j.length; f++)
				for(var g = a.j[f], h = a.l[g], l = 0; l < h.length; l++) { if(!e) { d = null == d ? g : d; break } var m = Hc(h[l], a.m, ",$"); if(m) { m = c + m; if(e >= m.length) { e -= m.length;
							b += m;
							c = a.m; break } else a.s && (c = e, m[c - 1] == a.m && --c, b += m.substr(0, c), c = a.m, e = 0);
						d = null == d ? g : d } } a = "";
			null != d && (a = c + "trn=" + d); return b + a },
		Jc = function(a) { var b = 1,
				c; for(c in a.l) b = c.length > b ? c.length : b; return 3997 - b - a.m.length - 1 }; var Lc = function(a, b, c, d, e, f) { if((d ? a.v : Math.random()) < (e || a.j)) try { if(c instanceof Ec) var g = c;
			else g = new Ec, zb(c, function(a, b) { var c = g,
					d = c.v++;
				a = Fc(b, a);
				c.j.push(d);
				c.l[d] = a }); var h = Kc(g, a.s, a.l, a.m + b + "&");
			h && ("undefined" === typeof f ? Yb(h, void 0) : Yb(h, f)) } catch(l) {} }; var Mc = function(a, b) { this.start = a < b ? a : b;
		this.j = a < b ? b : a }; var Nc = function(a, b) { this.j = b >= a ? new Mc(a, b) : null },
		Oc = function(a) { var b; try { a.localStorage && (b = parseInt(a.localStorage.getItem("google_experiment_mod"), 10)) } catch(c) { return null } if(0 <= b && 1E3 > b) return b; if(Bb()) return null;
			b = Math.floor(1E3 * yb(a)); try { if(a.localStorage) return a.localStorage.setItem("google_experiment_mod", "" + b), b } catch(c) {} return null }; var Pc = null; var Qc = function() { var a = n.performance; return a && a.now && a.timing ? Math.floor(a.now() + a.timing.navigationStart) : +new Date },
		Rc = function() { var a = void 0 === a ? n : a; return(a = a.performance) && a.now ? a.now() : null }; var Sc = function(a, b, c) { this.label = a;
		this.type = b;
		this.value = c;
		this.duration = 0;
		this.uniqueId = this.label + "_" + this.type + "_" + Math.random();
		this.slotId = void 0 }; var F = n.performance,
		Tc = !!(F && F.mark && F.measure && F.clearMarks),
		Uc = ob(function() { var a; if(a = Tc) { var b; if(null === Pc) { Pc = ""; try { a = ""; try { a = n.top.location.hash } catch(c) { a = n.location.hash } a && (Pc = (b = a.match(/\bdeid=([\d,]+)/)) ? b[1] : "") } catch(c) {} } b = Pc;
				a = !!b.indexOf && 0 <= b.indexOf("1337") } return a }),
		Wc = function() { var a = Vc;
			this.events = [];
			this.l = a || n; var b = null;
			a && (a.google_js_reporting_queue = a.google_js_reporting_queue || [], this.events = a.google_js_reporting_queue, b = a.google_measure_js_timing);
			this.j = Uc() || (null != b ? b : 1 > Math.random()) },
		Xc = function(a) { a && F && Uc() && (F.clearMarks("goog_" + a.uniqueId + "_start"), F.clearMarks("goog_" + a.uniqueId + "_end")) };
	Wc.prototype.start = function(a, b) { if(!this.j) return null; var c = Rc() || Qc();
		a = new Sc(a, b, c);
		b = "goog_" + a.uniqueId + "_start";
		F && Uc() && F.mark(b); return a }; var $c = function() { var a = Yc;
			this.C = Zc;
			this.s = !0;
			this.m = null;
			this.F = this.j;
			this.l = void 0 === a ? null : a;
			this.v = !1 },
		cd = function(a, b, c, d, e) { try { if(a.l && a.l.j) { var f = a.l.start(b.toString(), 3); var g = c(); var h = a.l;
					c = f; if(h.j && u(c.value)) { var l = Rc() || Qc();
						c.duration = l - c.value; var m = "goog_" + c.uniqueId + "_end";
						F && Uc() && F.mark(m);
						h.j && h.events.push(c) } } else g = c() } catch(k) { h = a.s; try { Xc(f), h = (e || a.F).call(a, b, new ad(bd(k), k.fileName, k.lineNumber), void 0, d) } catch(q) { a.j(217, q) } if(!h) throw k; } return g },
		dd = function(a, b) { var c = G; return function(d) { for(var e = [], f = 0; f < arguments.length; ++f) e[f] = arguments[f]; return cd(c, a, function() { return b.apply(void 0, e) }, void 0, void 0) } };
	$c.prototype.j = function(a, b, c, d, e) { e = e || "jserror"; try { var f = new Ec;
			f.s = !0;
			Ic(f, 1, "context", a);
			b.error && b.meta && b.id || (b = new ad(bd(b), b.fileName, b.lineNumber));
			b.msg && Ic(f, 2, "msg", b.msg.substring(0, 512));
			b.file && Ic(f, 3, "file", b.file);
			0 < b.line && Ic(f, 4, "line", b.line); var g = b.meta || {}; if(this.m) try { this.m(g) } catch(aa) {}
			if(d) try { d(g) } catch(aa) {} b = [g];
			f.j.push(5);
			f.l[5] = b;
			d = n;
			b = [];
			g = null;
			do { var h = d; if(A(h)) { var l = h.location.href;
					g = h.document && h.document.referrer || null } else l = g, g = null;
				b.push(new Dc(l || "", h)); try { d = h.parent } catch(aa) { d = null } } while (d && h != d);
			l = 0; for(var m = b.length - 1; l <= m; ++l) b[l].depth = m - l;
			h = n; if(h.location && h.location.ancestorOrigins && h.location.ancestorOrigins.length == b.length - 1)
				for(m = 1; m < b.length; ++m) { var k = b[m];
					k.url || (k.url = h.location.ancestorOrigins[m - 1] || "", k.ma = !0) }
			var q = new Dc(n.location.href, n, !1);
			h = null; var r = b.length - 1; for(k = r; 0 <= k; --k) { var p = b[k];!h && Bc.test(p.url) && (h = p); if(p.url && !p.ma) { q = p; break } } p = null; var t = b.length && b[r].url;
			0 != q.depth && t && (p = b[r]); var O = new Cc(q, p);
			O.l && Ic(f, 6, "top", O.l.url || "");
			Ic(f, 7, "url", O.j.url || "");
			Lc(this.C, e, f, this.v, c) } catch(aa) { try { Lc(this.C, e, { context: "ecmserr", rctx: a, msg: bd(aa), url: O && O.j.url }, this.v, c) } catch(rh) {} } return this.s }; var bd = function(a) { var b = a.toString();
			a.name && -1 == b.indexOf(a.name) && (b += ": " + a.name);
			a.message && -1 == b.indexOf(a.message) && (b += ": " + a.message); if(a.stack) { a = a.stack; var c = b; try {-1 == a.indexOf(c) && (a = c + "\n" + a); for(var d; a != d;) d = a, a = a.replace(/((https?:\/..*\/)[^\/:]*:\d+(?:.|\n)*)\2/, "$1");
					b = a.replace(/\n */g, "\n") } catch(e) { b = c } } return b },
		ad = function(a, b, c) { Ac.call(this, Error(a), { message: a, file: void 0 === b ? "" : b, line: void 0 === c ? -1 : c }) };
	ia(ad, Ac); var H = function(a) { a = void 0 === a ? "" : a; var b = Error.call(this);
		this.message = b.message; "stack" in b && (this.stack = b.stack);
		this.name = "TagError";
		this.message = a ? "adsbygoogle.push() error: " + a : "";
		Error.captureStackTrace ? Error.captureStackTrace(this, H) : this.stack = Error().stack || "" };
	ia(H, Error); var ed = function(a) { return 0 == (a.error && a.meta && a.id ? a.msg || bd(a.error) : bd(a)).indexOf("TagError") }; var Zc, G, Vc = hc(),
		Yc = new Wc,
		fd = function(a) { null != a && (Vc.google_measure_js_timing = a);
			Vc.google_measure_js_timing || (a = Yc, a.j = !1, a.events != a.l.google_js_reporting_queue && (Uc() && Ba(a.events, Xc), a.events.length = 0)) };
	Zc = new function() { var a = void 0 === a ? z : a;
		this.s = "http:" === a.location.protocol ? "http:" : "https:";
		this.l = "pagead2.googlesyndication.com";
		this.m = "/pagead/gen_204?id=";
		this.j = .01;
		this.v = Math.random() };
	G = new $c; "complete" == Vc.document.readyState ? fd() : Yc.j && Ub(Vc, "load", function() { fd() }); var id = function() { var a = [gd, hd];
			G.m = function(b) { Ba(a, function(a) { a(b) }) } },
		jd = function(a, b, c, d) { return cd(G, a, c, d, b) },
		kd = function(a, b) { return dd(a, b) },
		ld = G.j,
		md = function(a, b, c, d) { return ed(b) ? (G.v = !0, G.j(a, b, .1, d, "puberror"), !1) : G.j(a, b, c, d) },
		nd = function(a, b, c, d) { return ed(b) ? !1 : G.j(a, b, c, d) }; var od = new function() { this.j = ["google-auto-placed"];
		this.l = { google_tag_origin: "qs" } }; var pd = function(a, b) { a.location.href && a.location.href.substring && (b.url = a.location.href.substring(0, 200));
		Lc(Zc, "ama", b, !0, .01, void 0) }; var qd = function(a) { Wa(this, a, null) };
	ya(qd, x); var rd = null,
		sd = function() { if(!rd) { for(var a = n, b = a, c = 0; a && a != a.parent;)
					if(a = a.parent, c++, A(a)) b = a;
					else break;
				rd = b } return rd }; var td = { google: 1, googlegroups: 1, gmail: 1, googlemail: 1, googleimages: 1, googleprint: 1 },
		ud = /(corp|borg)\.google\.com:\d+$/,
		vd = function() { var a = z.google_page_location || z.google_page_url; "EMPTY" == a && (a = z.google_page_url); if(Pb || !a) return !1;
			a = a.toString();
			0 == a.indexOf("http://") ? a = a.substring(7, a.length) : 0 == a.indexOf("https://") && (a = a.substring(8, a.length)); var b = a.indexOf("/"); - 1 == b && (b = a.length);
			a = a.substring(0, b); if(ud.test(a)) return !1;
			a = a.split(".");
			b = !1;
			3 <= a.length && (b = a[a.length - 3] in td);
			2 <= a.length && (b = b || a[a.length - 2] in td); return b }; var wd = function(a) { this.j = this.l = null;
		sa(a) ? this.j = a : this.l = a };
	wd.prototype.getVerifier = function(a) { return this.l ? this.l[a] : null };
	wd.prototype.getSchema = function(a) { return this.j ? this.j(a) : null };
	wd.prototype.doesReturnAnotherSchema = function() { return this.j ? !0 : !1 }; var xd = function(a) { a = a.document; var b = {};
			a && (b = "CSS1Compat" == a.compatMode ? a.documentElement : a.body); return b || {} },
		I = function(a) { return xd(a).clientWidth }; var yd = function(a, b) { Array.prototype.slice.call(a).forEach(b, void 0) }; var zd = function(a, b, c, d) { this.s = a;
		this.l = b;
		this.m = c;
		this.j = d };
	zd.prototype.toString = function() { return JSON.stringify({ nativeQuery: this.s, occurrenceIndex: this.l, paragraphIndex: this.m, ignoreMode: this.j }) }; var Ad = function(a, b) { if(null == a.j) return b; switch(a.j) {
				case 1:
					return b.slice(1);
				case 2:
					return b.slice(0, b.length - 1);
				case 3:
					return b.slice(1, b.length - 1);
				case 0:
					return b;
				default:
					throw Error("Unknown ignore mode: " + a.j); } },
		Cd = function(a) { var b = [];
			yd(a.getElementsByTagName("p"), function(a) { 100 <= Bd(a) && b.push(a) }); return b },
		Bd = function(a) { if(3 == a.nodeType) return a.length; if(1 != a.nodeType || "SCRIPT" == a.tagName) return 0; var b = 0;
			yd(a.childNodes, function(a) { b += Bd(a) }); return b },
		Dd = function(a) { return 0 == a.length || isNaN(a[0]) ? a : "\\" + (30 + parseInt(a[0], 10)) + " " + a.substring(1) }; var Ed = function(a) { if(1 != a.nodeType) var b = !1;
		else if(b = "INS" == a.tagName) a: { b = ["adsbygoogle-placeholder"];a = a.className ? a.className.split(/\s+/) : []; for(var c = {}, d = 0; d < a.length; ++d) c[a[d]] = !0; for(d = 0; d < b.length; ++d)
				if(!c[b[d]]) { b = !1; break a }
			b = !0 }
		return b }; var Fd = function(a, b) { for(var c = 0; c < b.length; c++) { var d = b[c],
				e = Oa(d.Ja);
			a[e] = d.value } }; var Gd = { 1: 1, 2: 2, 3: 3, 0: 0 },
		Hd = function(a) { return null != a ? Gd[a] : a },
		Id = { 1: 0, 2: 1, 3: 2, 4: 3 }; var Jd = function(a, b) { if(!a) return !1;
			a = B(a, b); if(!a) return !1;
			a = a.cssFloat || a.styleFloat; return "left" == a || "right" == a },
		Kd = function(a) { for(a = a.previousSibling; a && 1 != a.nodeType;) a = a.previousSibling; return a ? a : null },
		Ld = function(a) { return !!a.nextSibling || !!a.parentNode && Ld(a.parentNode) }; var Md = function(a, b) { this.j = n;
			this.v = a;
			this.l = b;
			this.s = od || null;
			this.m = !1 },
		Od = function(a, b) { if(a.m) return !0; try { var c = a.j.localStorage.getItem("google_ama_settings"); var d = c ? new qd(c ? JSON.parse(c) : null) : null } catch(g) { d = null } if(null !== d && Ya(d, 2) && !Ya(a.l, 10)) return a = a.j.google_ama_state = a.j.google_ama_state || {}, a.eatf = !0;
			c = $a(a.l, uc, 1); for(d = 0; d < c.length; d++) { var e = c[d]; if(1 == y(e, 8)) { var f = Za(e, sc, 4); if(f && 2 == y(f, 1) && Nd(a, e, b)) return a.m = !0, a = a.j.google_ama_state = a.j.google_ama_state || {}, a.placement = d, !0 } } return !1 },
		Nd = function(a, b, c) { if(1 != y(b, 8)) return !1; var d = Za(b, qc, 1); if(!d) return !1; var e = y(d, 7); if(y(d, 1) || y(d, 3) || 0 < Xa(d, 4).length) { var f = y(d, 3),
					g = y(d, 1),
					h = Xa(d, 4);
				e = y(d, 2); var l = y(d, 5);
				d = Hd(y(d, 6)); var m = "";
				g && (m += g);
				f && (m += "#" + Dd(f)); if(h)
					for(f = 0; f < h.length; f++) m += "." + Dd(h[f]);
				e = (h = m) ? new zd(h, e, l, d) : null } else e = e ? new zd(e, y(d, 2), y(d, 5), Hd(y(d, 6))) : null; if(!e) return !1;
			l = []; try { l = a.j.document.querySelectorAll(e.s) } catch(p) {} if(l.length) { h = l.length; if(0 < h) { d = Array(h); for(f = 0; f < h; f++) d[f] = l[f];
					l = d } else l = [];
				l = Ad(e, l);
				u(e.l) && (h = e.l, 0 > h && (h += l.length), l = 0 <= h && h < l.length ? [l[h]] : []); if(u(e.m)) { h = []; for(d = 0; d < l.length; d++) f = Cd(l[d]), g = e.m, 0 > g && (g += f.length), 0 <= g && g < f.length && h.push(f[g]);
					l = h } e = l } else e = []; if(0 == e.length) return !1;
			e = e[0];
			l = y(b, 2);
			l = Id[l];
			l = void 0 !== l ? l : null; if(!(h = null == l)) { a: { h = a.j; switch(l) {
						case 0:
							h = Jd(Kd(e), h); break a;
						case 3:
							h = Jd(e, h); break a;
						case 2:
							d = e.lastChild;
							h = Jd(d ? 1 == d.nodeType ? d : Kd(d) : null, h); break a } h = !1 } if(c = !h && !(!c && 2 == l && !Ld(e))) c = 1 == l || 2 == l ? e : e.parentNode, c = !(c && !Ed(c) && 0 >= c.offsetWidth);h = !c } if(h) return !1;
			b = Za(b, rc, 3);
			h = {};
			b && (h.qa = y(b, 1), h.ha = y(b, 2), h.ua = !!y(b, 3)); var k;
			b = a.j;
			c = a.s;
			d = a.v;
			f = b.document;
			a = nb(new mb(f), "DIV");
			g = a.style;
			g.textAlign = "center";
			g.width = "100%";
			g.height = "auto";
			g.clear = h.ua ? "both" : "none";
			h.xa && Fd(g, h.xa);
			f = nb(new mb(f), "INS");
			g = f.style;
			g.display = "block";
			g.margin = "auto";
			g.backgroundColor = "transparent";
			h.qa && (g.marginTop = h.qa);
			h.ha && (g.marginBottom = h.ha);
			h.ta && Fd(g, h.ta);
			a.appendChild(f);
			f.setAttribute("data-ad-format", "auto");
			h = []; if(g = c && c.j) a.className = g.join(" ");
			f.className = "adsbygoogle";
			f.setAttribute("data-ad-client", d);
			h.length && f.setAttribute("data-ad-channel", h.join("+"));
			a: { try { switch(l) {
						case 0:
							e.parentNode && e.parentNode.insertBefore(a, e); break;
						case 3:
							var q = e.parentNode; if(q) { var r = e.nextSibling; if(r && r.parentNode != q)
									for(; r && 8 == r.nodeType;) r = r.nextSibling;
								q.insertBefore(a, r) } break;
						case 1:
							e.insertBefore(a, e.firstChild); break;
						case 2:
							e.appendChild(a) } Ed(e) && (e.setAttribute("data-init-display", e.style.display), e.style.display = "block");
					f.setAttribute("data-adsbygoogle-status", "reserved");
					f.className += " adsbygoogle-noablate";
					q = { element: f };
					(k = c && c.l) && (q.params = k);
					(b.adsbygoogle = b.adsbygoogle || []).push(q) } catch(p) { a && a.parentNode && (k = a.parentNode, k.removeChild(a), Ed(k) && (k.style.display = k.getAttribute("data-init-display") || "none"));
					k = !1; break a } k = !0 }
			return k ? !0 : !1 }; var Qd = function() { this.l = new Pd(this);
			this.j = 0 },
		Rd = function(a) { if(0 != a.j) throw Error("Already resolved/rejected."); },
		Pd = function(a) { this.j = a };
	Pd.prototype.then = function(a, b) { if(this.l) throw Error("Then functions already set.");
		this.l = a;
		this.m = b;
		Sd(this) }; var Sd = function(a) { switch(a.j.j) {
			case 0:
				break;
			case 1:
				a.l && a.l(a.j.s); break;
			case 2:
				a.m && a.m(a.j.m); break;
			default:
				throw Error("Unhandled deferred state."); } }; var Td = function(a) { this.exception = a },
		Ud = function(a, b) { this.l = n;
			this.m = a;
			this.j = b };
	Ud.prototype.start = function() { this.s() };
	Ud.prototype.s = function() { try { switch(this.l.document.readyState) {
				case "complete":
				case "interactive":
					Od(this.m, !0);
					Vd(this); break;
				default:
					Od(this.m, !1) ? Vd(this) : this.l.setTimeout(wa(this.s, this), 100) } } catch(a) { Vd(this, a) } }; var Vd = function(a, b) { try { var c = a.j,
				d = new Td(b);
			Rd(c);
			c.j = 1;
			c.s = d;
			Sd(c.l) } catch(e) { a = a.j, b = e, Rd(a), a.j = 2, a.m = b, Sd(a.l) } }; var Wd = function(a) { pd(a, { atf: 1 }) },
		Xd = function(a, b) {
			(a.google_ama_state = a.google_ama_state || {}).exception = b;
			pd(a, { atf: 0 }) }; var Yd = function() { this.wasPlaTagProcessed = !1;
		this.wasReactiveAdConfigReceived = {};
		this.adCount = {};
		this.wasReactiveAdVisible = {};
		this.stateForType = {};
		this.reactiveTypeEnabledInAsfe = {};
		this.isReactiveTagFirstOnPage = this.wasReactiveAdConfigHandlerRegistered = this.wasReactiveTagRequestSent = !1;
		this.reactiveTypeDisabledByPublisher = {};
		this.debugCard = null;
		this.messageValidationEnabled = this.debugCardRequested = !1;
		this.adRegion = this.floatingAdsFillMessage = this.grappleTagStatusService = null }; var hd = function(a) { try { var b = n.google_ad_modifications; if(null != b) { var c = Ca(b.eids, b.loeids);
					null != c && 0 < c.length && (a.eid = c.join(",")) } } catch(d) {} },
		gd = function(a) { a.shv = Ob() };
	G.s = !Pb; var $d = function(a, b) { if(!a) return !1;
			a = a.hash; if(!a || !a.indexOf) return !1; if(-1 != a.indexOf(b)) return !0;
			b = Zd(b); return "go" != b && -1 != a.indexOf(b) ? !0 : !1 },
		Zd = function(a) { var b = "";
			$b(a.split("_"), function(a) { b += a.substr(0, 2) }); return b }; var ae = { 9: "400", 10: "100", 11: "0.10", 12: "0.02", 13: "0.001", 14: "300", 15: "100", 19: "0.01", 22: "0.01", 23: "0.2", 24: "0.05", 26: "0.5", 27: "0.001", 28: "0.001", 29: "0.01", 34: "0.001", 37: "0.0", 40: "0.15", 43: "0.02", 47: "0.01", 52: "1", 54: "800", 55: "200", 56: "0.001", 57: "0.001", 60: "0.03", 66: "0.0", 67: "0.04", 71: "700", 72: "10", 74: "0.03", 76: "0.004", 77: "true", 78: "0.1", 79: "1200", 80: "2", 82: "3", 83: "1.0", 92: "0.02", 96: "700", 97: "2", 98: "0.01", 99: "600", 100: "100", 103: "0.01", 104: "0.1", 105: "0", 106: "20", 107: "0.01", 108: "500", 109: "2", 110: "0.02", 111: "0.1", 112: "0.02", 113: "0.002", 114: "0.01" }; var be = null,
		ce = function() { this.j = ae },
		J = function(a, b) { a = parseFloat(a.j[b]); return isNaN(a) ? 0 : a },
		de = function() { be || (be = new ce); return be }; var ee = { o: "368226300", u: "368226301" },
		fe = { o: "368226310", u: "368226311" },
		ge = { o: "36998750", u: "36998751" },
		he = { o: "4089040", ca: "4089042" },
		ie = { o: "40993900", u: "40993901" },
		je = { o: "40993910", u: "40993911" },
		ke = { D: "20040067", o: "20040068", ba: "1337" },
		le = { o: "21060548", D: "21060549" },
		me = { o: "21060623", D: "21060624" },
		ne = { X: "62710015", o: "62710016" },
		oe = { X: "62710017", o: "62710018" },
		pe = { o: "201222021", I: "201222022" },
		qe = { o: "201222031", I: "201222032" },
		re = { ra: "21060869", U: "21060870", V: "21060871" },
		se = { o: "332260000", J: "332260003" },
		te = { o: "332260004", J: "332260007" },
		ue = { o: "21060518", u: "21060519" },
		ve = { o: "21060830", fa: "21060831", Y: "21060832", ea: "21060843", da: "21061122" },
		we = { o: "21061394", u: "21061395" },
		xe = { o: "10583695", u: "10583696" },
		ye = { o: "10593695", u: "10593696" },
		ze = { o: "21061781", u: "21061782" },
		Ae = { o: "21061898", u: "21061899" }; var Be = new Nc(0, 199),
		Ce = new Nc(200, 399),
		De = new Nc(400, 499),
		Ee = new Nc(500, 599),
		Fe = new Nc(600, 699),
		Ge = new Nc(700, 799),
		He = new Nc(800, 999); var Je = function(a) { var b = de(),
				c;
			$d(a.location, "google_responsive_slot_debug") || $d(a.location, "google_responsive_slot_preview") ? c = "182982100" : c = Ie(a, Ge, J(b, 96), J(b, 97), ["182982000", "182982100"]); if(!c) return { K: "", L: "" };
			a = {};
			a = (a["182982000"] = "182982200", a["182982100"] = "182982300", a)[c]; return { K: c, L: a } },
		Ke = function(a) { var b = de(),
				c = Ie(a, Ge, J(b, 71), J(b, 72), ["153762914", "153762975"]),
				d = ""; "153762914" == c ? d = "153762530" : "153762975" == c && (d = "153762841"); if(c) return { K: c, L: d };
			c = Ie(a, Ge, J(b, 71) + J(b, 72), J(b, 80), ["164692081", "165767636"]); "164692081" == c ? d = "166717794" : "165767636" == c && (d = "169062368"); return { K: c || "", L: d } },
		Le = function(a) { var b = a.google_ad_modifications = a.google_ad_modifications || {}; if(!b.plle) { b.plle = !0; var c = b.eids = b.eids || [];
				b = b.loeids = b.loeids || []; var d = de(),
					e = Je(a),
					f = e.K;
				e = e.L; if(f && e) K(c, f), K(c, e);
				else { var g = Ke(a);
					K(b, g.K);
					K(c, g.L) } g = fe;
				f = Ie(a, Be, J(d, 105), J(d, 106), [g.o, g.u]);
				K(b, f); var h = ee;
				f == g.o ? e = h.o : f == g.u ? e = h.u : e = "";
				K(c, e);
				g = he;
				K(c, Ie(a, De, J(d, 9), J(d, 10), [g.o, g.ca]));
				g = je;
				f = Ie(a, Ee, J(d, 108), J(d, 109), [g.o, g.u]);
				K(b, f);
				h = ie;
				f == g.o ? e = h.o : f == g.u ? e = h.u : e = "";
				K(c, e);
				Da("") && K(b, "");
				g = ne;
				f = L(a, J(d, 11), [g.o, g.X]);
				g = Ra(g, function(a) { return a == f });
				g = oe[g];
				K(c, f);
				K(c, g);
				g = re;
				g = L(a, J(d, 12), [g.ra, g.U, g.V]);
				K(c, g);
				g || (g = ue, f = L(a, J(d, 56), [g.o, g.u]), K(c, f));
				g = ze;
				f = L(a, J(d, 110), [g.u, g.o]);
				K(c, f);
				g = ke;
				f = L(a, J(d, 13), [g.D, g.o]);
				K(c, f);
				f = L(a, 0, [g.ba]);
				K(c, f);
				g = le;
				f = L(a, J(d, 60), [g.D, g.o]);
				K(c, f);
				f == le.D && (g = me, f = L(a, J(d, 66), [g.D, g.o]), K(c, f));
				g = qe;
				f = Ie(a, Ce, J(d, 14), J(d, 15), [g.o, g.I]);
				K(b, f);
				h = pe;
				f == g.o ? e = h.o : f == g.I ? e = h.I : e = "";
				K(c, e);
				g = te;
				f = Ie(a, He, J(d, 54), J(d, 55), [g.o, g.J]);
				K(b, f);
				h = se;
				f == g.o ? e = h.o : f == g.J ? e = h.J : e = "";
				K(c, e);
				g = ge;
				f = L(a, J(d, 98), [g.o, g.u]);
				K(c, f); if(Fb(d.j[77], !1) || Pb) g = ve, f = L(a, J(d, 76), [g.o, g.fa, g.Y, g.ea]), K(c, f), f || (f = L(a, J(d, 83), [g.da]), K(c, f));
				g = we;
				f = L(a, J(d, 92), [g.o, g.u]);
				K(c, f);
				g = xe;
				f = Ie(a, Fe, J(d, 99), J(d, 100), [g.o, g.u]);
				K(b, f);
				h = ye;
				f == g.o ? e = h.o : f == g.u ? e = h.u : e = "";
				K(c, e);
				g = Ae;
				K(b, L(a, J(d, 114), [g.o, g.u])) } },
		K = function(a, b) { b && a.push(b) },
		Me = function(a, b) { for(var c = [], d = 1; d < arguments.length; ++d) c[d - 1] = arguments[d];
			d = (d = (d = a.location && a.location.hash) && (d.match(/google_plle=([\d,]+)/) || d.match(/deid=([\d,]+)/))) && d[1]; var e; if(e = !!d) a: { d = xa(v, d);e = c.length; for(var f = ma(c) ? c.split("") : c, g = 0; g < e; g++)
					if(g in f && d.call(void 0, f[g], g, c)) { e = !0; break a }
				e = !1 }
			return e },
		L = function(a, b, c) { for(var d = 0; d < c.length; d++)
				if(Me(a, c[d])) return c[d];
			a: { if(!Bb() && (a = Math.random(), a < b)) { a = yb(n);
					b = c[Math.floor(a * c.length)]; break a } b = null }
			return b },
		Ie = function(a, b, c, d, e) { for(var f = 0; f < e.length; f++)
				if(Me(a, e[f])) return e[f];
			f = new Mc(c, c + d - 1);
			(d = 0 >= d || d % e.length) || (b = b.j, d = !(b.start <= f.start && b.j >= f.j));
			d ? c = null : (a = Oc(a), c = null !== a && f.start <= a && f.j >= a ? e[(a - c) % e.length] : null); return c }; var Ne = function(a) { if(!a) return "";
		(a = a.toLowerCase()) && "ca-" != a.substring(0, 3) && (a = "ca-" + a); return a }; var Oe = function(a, b, c, d) { d = void 0 === d ? "" : d; var e = ["<iframe"],
				f; for(f in a) a.hasOwnProperty(f) && bc(e, f + "=" + a[f]);
			e.push('style="' + ("left:0;position:absolute;top:0;width:" + b + "px;height:" + c + "px;") + '"');
			e.push("></iframe>");
			a = a.id;
			b = "border:none;height:" + c + "px;margin:0;padding:0;position:relative;visibility:visible;width:" + b + "px;background-color:transparent;"; return ['<ins id="', a + "_expand", '" style="display:inline-table;', b, void 0 === d ? "" : d, '"><ins id="', a + "_anchor", '" style="display:block;', b, '">', e.join(" "), "</ins></ins>"].join("") },
		Pe = function(a, b, c) { if(A(a.document.getElementById(b).contentWindow)) a = a.document.getElementById(b).contentWindow, b = a.document, b.body && b.body.firstChild || (/Firefox/.test(navigator.userAgent) ? b.open("text/html", "replace") : b.open(), a.google_async_iframe_close = !0, b.write(c));
			else { a = a.document.getElementById(b).contentWindow;
				c = String(c);
				b = ['"']; for(var d = 0; d < c.length; d++) { var e = c.charAt(d),
						f = e.charCodeAt(0),
						g = d + 1,
						h; if(!(h = Ma[e])) { if(!(31 < f && 127 > f))
							if(f = e, f in Na) e = Na[f];
							else if(f in Ma) e = Na[f] = Ma[f];
						else { h = f.charCodeAt(0); if(31 < h && 127 > h) e = f;
							else { if(256 > h) { if(e = "\\x", 16 > h || 256 < h) e += "0" } else e = "\\u", 4096 > h && (e += "0");
								e += h.toString(16).toUpperCase() } e = Na[f] = e } h = e } b[g] = h } b.push('"');
				a.location.replace("javascript:" + b.join("")) } }; var Qe = null; var Re = { rectangle: 1, horizontal: 2, vertical: 4 }; var M = function(a, b) { this.v = a;
		this.s = b };
	M.prototype.minWidth = function() { return this.v };
	M.prototype.height = function() { return this.s };
	M.prototype.j = function(a) { return 300 < a && 300 < this.s ? this.v : Math.min(1200, Math.round(a)) };
	M.prototype.m = function(a) { return this.j(a) + "x" + this.height() };
	M.prototype.l = function() {}; var N = function(a, b, c, d) { d = void 0 === d ? !1 : d;
		M.call(this, a, b);
		this.M = c;
		this.va = d };
	ia(N, M);
	N.prototype.aa = function() { return this.M };
	N.prototype.l = function(a, b, c, d) { 1 != c.google_ad_resize && (d.style.height = this.height() + "px") }; var Se = function(a) { return function(b) { return !!(b.M & a) } };

	function Te(a, b) { for(var c = ["width", "height"], d = 0; d < c.length; d++) { var e = "google_ad_" + c[d]; if(!b.hasOwnProperty(e)) { var f = C(a[c[d]]);
				f = null === f ? null : Math.round(f);
				null != f && (b[e] = f) } } } var Ue = function(a, b) { return !((Db.test(b.google_ad_width) || Cb.test(a.style.width)) && (Db.test(b.google_ad_height) || Cb.test(a.style.height))) },
		Ve = function(a, b) { try { var c = b.document.documentElement.getBoundingClientRect(),
					d = a.getBoundingClientRect(); var e = { x: d.left - c.left, y: d.top - c.top } } catch(f) { e = null } return(a = e) ? a.y : 0 },
		We = function(a, b) { do { var c = B(a, b); if(c && "fixed" == c.position) return !1 } while (a = a.parentElement); return !0 },
		Xe = function(a) { var b = 0,
				c; for(c in Re) - 1 != a.indexOf(c) && (b |= Re[c]); return b },
		Ye = function(a, b) { for(var c = I(b), d = 0; 100 > d && a; d++) { var e = B(a, b); if(e && "hidden" == e.overflowX && (e = C(e.width)) && e < c) return !0;
				a = a.parentElement } return !1 },
		Ze = function(a, b) { for(var c = a, d = 0; 100 > d && c; d++) { var e = c.style; if(e && e.height && "auto" != e.height && "inherit" != e.height || e && e.maxHeight && "auto" != e.maxHeight && "inherit" != e.maxHeight) return !1;
				c = c.parentElement } c = a; for(d = 0; 100 > d && c; d++) { if((e = B(c, b)) && "hidden" == e.overflowY) return !1;
				c = c.parentElement } c = a; for(d = 0; 100 > d && c; d++) { a: { e = a; var f = ["height", "max-height"],
						g = b.document.styleSheets; if(g)
						for(var h = e.matches || e.webkitMatchesSelector || e.mozMatchesSelector || e.msMatchesSelector || e.oMatchesSelector, l = 0; l < Math.min(g.length, 10); ++l) { var m = void 0; try { var k = g[l],
									q = null; try { q = k.cssRules || k.rules } catch(t) { if(15 == t.code) throw t.styleSheet = k, t; } m = q } catch(t) { continue } if(m && 0 < m.length)
								for(q = 0; q < Math.min(m.length, 10); ++q)
									if(1 === m[q].type) { var r = m[q]; if(h.call(e, r.selectorText))
											for(var p = 0; p < f.length; ++p)
												if(v(r.cssText, f[p])) { e = !0; break a } } } e = !1 } if(e) return !1;c = c.parentElement } return !0 },
		$e = function(a, b, c, d) { if((Pb && a.google_top_window || a.top) != a) return jc(a) ? 3 : 16; if(!(488 > I(a))) return 4; if(!(a.innerHeight >= a.innerWidth)) return 5; var e = I(a); return !e || (e - c) / e > d ? 6 : Ye(b.parentElement, a) ? 7 : !0 },
		bf = function(a, b, c) { var d = $e(b, c, a, .3); if(!0 !== d) return d;
			d = I(b);
			a = d - a; var e = af(b) || E(b, fe.u) ? 0 : 5;
			d = d && a >= e ? !0 : d ? 0 <= a && E(b, fe.o) ? 15 : -10 > a ? 11 : 0 > a ? 14 : 0 == a ? 13 : 12 : 10; return !0 !== d ? d : We(c, b) ? !0 : 9 },
		cf = function(a, b, c) { return { na: C(a.paddingLeft) || 0, direction: a.direction, ja: b - c } },
		df = function(a, b) { if(3 == b.nodeType) return /\S/.test(b.data); if(1 == b.nodeType) { if(/^(script|style)$/i.test(b.nodeName)) return !1; try { var c = B(b, a) } catch(d) {} return !c || "none" != c.display && !("absolute" == c.position && ("hidden" == c.visibility || "collapse" == c.visibility)) } return !1 },
		ef = function(a, b, c, d, e, f) { if(a = B(c, a)) { var g = cf(a, e, d);
				d = g.direction;
				a = g.na;
				g = g.ja;
				f.google_ad_resize ? c = -1 * (g + a) + "px" : (c = Jb(c) + a, c = "rtl" == d ? -1 * (g - c) + "px" : -1 * c + "px"); "rtl" == d ? b.style.marginRight = c : b.style.marginLeft = c;
				b.style.width = e + "px";
				b.style.zIndex = 30 } },
		af = function(a) { return a.location && "#gfwrffwaifhp" == a.location.hash }; var P = function(a, b, c, d) { d = void 0 === d ? function(a) { return a } : d; var e; return a.style && a.style[c] && d(a.style[c]) || (e = B(a, b)) && e[c] && d(e[c]) || null },
		ff = function(a) { return function(b) { return b.minWidth() <= a } },
		jf = function(a, b, c, d) { var e = a && gf(c, b),
				f = hf(b, d); return function(a) { return !(e && a.height() >= f) } },
		kf = function(a) { return function(b) { return b.height() <= a } },
		gf = function(a, b) { return Ve(a, b) < xd(b).clientHeight - 100 },
		lf = function(a, b) { var c = Infinity;
			do { var d = P(b, a, "height", C);
				d && (c = Math.min(c, d));
				(d = P(b, a, "maxHeight", C)) && (c = Math.min(c, d)) } while ((b = b.parentElement) && "HTML" != b.tagName); return c },
		mf = function(a, b) { var c = P(b, a, "height", C); if(c) return c; var d = b.style.height;
			b.style.height = "inherit";
			c = P(b, a, "height", C);
			b.style.height = d; if(c) return c;
			c = Infinity;
			do(d = b.style && C(b.style.height)) && (c = Math.min(c, d)), (d = P(b, a, "maxHeight", C)) && (c = Math.min(c, d)); while ((b = b.parentElement) && "HTML" != b.tagName); return c },
		hf = function(a, b) { var c = a.google_unique_id; return b && 0 == ("number" === typeof c ? c : 0) ? Math.max(250, 2 * xd(a).clientHeight / 3) : 250 }; var Q = function(a, b, c, d, e, f, g, h, l, m, k) { this.W = a;
			this.j = b;
			this.M = void 0 === c ? null : c;
			this.R = void 0 === d ? null : d;
			this.l = void 0 === e ? null : e;
			this.m = void 0 === f ? null : f;
			this.N = void 0 === g ? null : g;
			this.O = void 0 === h ? null : h;
			this.s = void 0 === l ? null : l;
			this.v = void 0 === m ? null : m;
			this.P = void 0 === k ? null : k;
			this.T = this.F = this.C = null },
		nf = function(a, b, c) { null != a.M && (c.google_responsive_formats = a.M);
			null != a.R && (c.google_safe_for_responsive_override = a.R);
			null != a.l && (!0 === a.l ? c.google_full_width_responsive_allowed = !0 : 15 === a.l ? (c.google_full_width_responsive_allowed = !0, c.gfwrnwer = 15) : (c.google_full_width_responsive_allowed = !1, c.gfwrnwer = a.l));
			null != a.m && !0 !== a.m && (c.gfwrnher = a.m); var d = a.j.j(b),
				e = a.j.height();
			1 != c.google_ad_resize && (c.google_ad_width = d, c.google_ad_height = e, c.google_ad_format = a.j.m(b), c.google_responsive_auto_format = a.W, c.google_ad_resizable = !0, c.google_override_format = 1, c.google_loader_features_used = 128, !0 === a.l && (c.gfwrnh = a.j.height() + "px"));
			null != a.N && (c.gfwroml = a.N);
			null != a.O && (c.gfwromr = a.O);
			null != a.s && (c.gfwroh = a.s, c.google_resizing_height = a.s);
			null != a.v && (c.gfwrow = a.v, c.google_resizing_width = a.v);
			null != a.P && (c.gfwroz = a.P);
			null != a.C && (c.gml = a.C);
			null != a.F && (c.gmr = a.F);
			null != a.T && (c.gzi = a.T);
			b = hc(); if($d(b.location, "google_responsive_slot_debug") || Me(b, "182982000", "182982100")) c.ds = "outline:thick dashed " + (d && e ? !0 !== a.l || !0 !== a.m ? "#ffa500" : "#0f0" : "#f00") + " !important;" }; var of = function() { return !(v(w, "iPad") || v(w, "Android") && !v(w, "Mobile") || v(w, "Silk")) && (v(w, "iPod") || v(w, "iPhone") || v(w, "Android") || v(w, "IEMobile")) }; var pf = ["google_content_recommendation_ui_type", "google_content_recommendation_columns_num", "google_content_recommendation_rows_num"],
		R = {},
		qf = (R.image_stacked = 1 / 1.91, R.image_sidebyside = 1 / 3.82, R.mobile_banner_image_sidebyside = 1 / 3.82, R.pub_control_image_stacked = 1 / 1.91, R.pub_control_image_sidebyside = 1 / 3.82, R.pub_control_image_card_stacked = 1 / 1.91, R.pub_control_image_card_sidebyside = 1 / 3.74, R.pub_control_text = 0, R.pub_control_text_card = 0, R),
		S = {},
		rf = (S.image_stacked = 80, S.image_sidebyside = 0, S.mobile_banner_image_sidebyside = 0, S.pub_control_image_stacked = 80, S.pub_control_image_sidebyside = 0, S.pub_control_image_card_stacked = 85, S.pub_control_image_card_sidebyside = 0, S.pub_control_text = 80, S.pub_control_text_card = 80, S),
		sf = {},
		tf = (sf.pub_control_image_stacked = 100, sf.pub_control_image_sidebyside = 200, sf.pub_control_image_card_stacked = 150, sf.pub_control_image_card_sidebyside = 250, sf.pub_control_text = 100, sf.pub_control_text_card = 150, sf),
		uf = function(a, b) { M.call(this, a, b) };
	ia(uf, M);
	uf.prototype.j = function(a) { return Math.min(1200, Math.max(this.minWidth(), Math.round(a))) }; var vf = function(a) { var b = 0;
			$b(pf, function(c) { null != a[c] && ++b }); if(0 === b) return !1; if(b === pf.length) return !0; throw new H("Tags data-matched-content-ui-type, data-matched-content-columns-num and data-matched-content-rows-num should be set together."); },
		zf = function(a, b) { wf(a, b); if(a < Nb) { if( of ()) { xf(b, "mobile_banner_image_sidebyside", 1, 12); var c = +b.google_content_recommendation_columns_num;
					c = (a - 8 * c - 8) / c; var d = b.google_content_recommendation_ui_type;
					b = b.google_content_recommendation_rows_num - 1; return new Q(9, new uf(a, Math.floor(c / 1.91 + 70) + Math.floor((c * qf[d] + rf[d]) * b + 8 * b + 8))) } xf(b, "image_sidebyside", 1, 13); return new Q(9, yf(a)) } xf(b, "image_stacked", 4, 2); return new Q(9, yf(a)) };

	function yf(a) { return 1200 <= a ? new uf(1200, 600) : 850 <= a ? new uf(a, Math.floor(.5 * a)) : 550 <= a ? new uf(a, Math.floor(.6 * a)) : 468 <= a ? new uf(a, Math.floor(.7 * a)) : new uf(a, Math.floor(3.44 * a)) } var Af = function(a, b) { wf(a, b); var c = b.google_content_recommendation_ui_type.split(","),
			d = b.google_content_recommendation_columns_num.split(","),
			e = b.google_content_recommendation_rows_num.split(",");
		a: { if(c.length == d.length && d.length == e.length) { if(1 == c.length) { var f = 0; break a } if(2 == c.length) { f = a < Nb ? 0 : 1; break a } throw new H("The parameter length of attribute data-matched-content-ui-type, data-matched-content-columns-num and data-matched-content-rows-num is too long. At most 2 parameters for each attribute are needed: one for mobile and one for desktop, while " + ("you are providing " + c.length + ' parameters. Example: \n data-matched-content-rows-num="4,2"\ndata-matched-content-columns-num="1,6"\ndata-matched-content-ui-type="image_stacked,image_card_sidebyside".')); } if(c.length != d.length) throw new H('The parameter length of data-matched-content-ui-type does not match data-matched-content-columns-num. Example: \n data-matched-content-rows-num="4,2"\ndata-matched-content-columns-num="1,6"\ndata-matched-content-ui-type="image_stacked,image_card_sidebyside".'); throw new H('The parameter length of data-matched-content-columns-num does not match data-matched-content-rows-num. Example: \n data-matched-content-rows-num="4,2"\ndata-matched-content-columns-num="1,6"\ndata-matched-content-ui-type="image_stacked,image_card_sidebyside".'); } c = c[f];
		c = 0 == c.lastIndexOf("pub_control_", 0) ? c : "pub_control_" + c;
		d = +d[f]; for(var g = tf[c], h = d; a / h < g && 1 < h;) h--;
		h !== d && n.console && n.console.warn("adsbygoogle warning: data-matched-content-columns-num " + d + " is too large. We override it to " + h + ".");
		d = h;
		e = +e[f];
		xf(b, c, d, e); if(Number.isNaN(d) || 0 === d) throw new H("Wrong value for data-matched-content-columns-num"); if(Number.isNaN(e) || 0 === e) throw new H("Wrong value for data-matched-content-rows-num");
		b = Math.floor(((a - 8 * d - 8) / d * qf[c] + rf[c]) * e + 8 * e + 8); if(1500 < a) throw new H("Calculated slot width is too large: " + a); if(1500 < b) throw new H("Calculated slot height is too large: " + b); return new Q(9, new uf(a, b)) };

	function wf(a, b) { if(0 >= a) throw new H("Invalid responsive width from Matched Content slot " + b.google_ad_slot + ": " + a + ". Please ensure to put this Matched Content slot into a non-zero width div container."); }

	function xf(a, b, c, d) { a.google_content_recommendation_ui_type = b;
		a.google_content_recommendation_columns_num = c;
		a.google_content_recommendation_rows_num = d }; var Bf = function(a, b) { M.call(this, a, b) };
	ia(Bf, M);
	Bf.prototype.j = function() { return this.minWidth() };
	Bf.prototype.l = function(a, b, c, d) { var e = this.j(b);
		ef(a, d, d.parentElement, b, e, c);
		1 != c.google_ad_resize && (d.style.height = this.height() + "px") }; var Cf = function(a) { return function(b) { for(var c = a.length - 1; 0 <= c; --c)
					if(!a[c](b)) return !1; return !0 } },
		Df = function(a, b, c) { for(var d = a.length, e = null, f = 0; f < d; ++f) { var g = a[f]; if(b(g)) { if(!c || c(g)) return g;
					null === e && (e = g) } } return e }; var T = [new N(970, 90, 2), new N(728, 90, 2), new N(468, 60, 2), new N(336, 280, 1), new N(320, 100, 2), new N(320, 50, 2), new N(300, 600, 4), new N(300, 250, 1), new N(250, 250, 1), new N(234, 60, 2), new N(200, 200, 1), new N(180, 150, 1), new N(160, 600, 4), new N(125, 125, 1), new N(120, 600, 4), new N(120, 240, 4)],
		Ef = [T[6], T[12], T[3], T[0], T[7], T[14], T[1], T[8], T[10], T[4], T[15], T[2], T[11], T[5], T[13], T[9]],
		Ff = new N(120, 120, 1, !0),
		Gf = new N(120, 50, 2, !0); var If = function(a, b, c, d, e) { "false" != e.google_full_width_responsive || af(c) ? Hf(b, c, !0) || 1 == e.google_ad_resize ? (e = bf(a, c, d), b = !0 !== e ? { w: a, A: e } : Hf(b, c, !1) ? { w: I(c) || a, A: !0 } : { w: a, A: 15 }) : b = { w: a, A: 2 } : b = { w: a, A: 1 };
			c = b.A; return !0 !== c && 15 !== c ? { w: a, A: c } : d.parentElement ? { w: b.w, A: c } : { w: a, A: c } },
		Lf = function(a, b, c, d, e, f, g) { f = void 0 === f ? !1 : f;
			g = void 0 === g ? !1 : g; var h = jd(247, ld, function() { return If(a, b, c, d, e) }),
				l = h.w;
			h = h.A; var m = !0 === h && (a != l || (af(c) ? !0 : E(c, fe.u))),
				k = P(d, c, "width", C) || e.google_ad_width || 0,
				q = P(d, c, "height", C) || e.google_ad_height || 0;
			m = Jf(l, b, c, d, e, m, k, q, f, g);
			f = m.H;
			g = m.G;
			l = m.aa;
			m = m.wa; var r = Kf(b, l),
				p, t = (p = P(d, c, "marginLeft", C)) ? p + "px" : "",
				O = (p = P(d, c, "marginRight", C)) ? p + "px" : "";
			p = P(d, c, "zIndex") || ""; return new Q(r, f, l, m, h, g, t, O, q, k, p) },
		Mf = function(a) { return "auto" == a || /^((^|,) *(horizontal|vertical|rectangle) *)+$/.test(a) },
		Hf = function(a, b, c) { return "auto" == a || 0 < (Xe(a) & 1) || "autorelaxed" == a && E(b, xe.u) ? !0 : Mf(a) && ((af(b) ? !0 : E(b, fe.u)) || c && E(b, fe.o)) },
		Jf = function(a, b, c, d, e, f, g, h, l, m) { l = void 0 === l ? !1 : l;
			m = void 0 === m ? !1 : m;
			b = "auto" == b ? .25 >= a / Math.min(1200, I(c)) ? 4 : 3 : Xe(b); var k, q = of () && !gf(d, c) && (k = We(d, c)),
				r = of () && gf(d, c) && (E(c, qe.I) || E(c, qe.o) || m) && (k = We(d, c)) && (E(c, qe.I) || m),
				p = (q ? Ef : T).slice(0);
			p = Ca(p, E(c, te.J) ? [Ff, Gf] : []); var t = 488 > I(c);
			t = [ff(a), Nf(t), jf(t, c, d, r), Se(b)];
			null != e.google_max_responsive_height && t.push(kf(e.google_max_responsive_height));
			l && t.push(function(a) { return a.minWidth() >= g && a.height() >= h }); var O = [function(a) { return !a.va }]; if(q || r) q = q ? lf(c, d) : mf(c, d), O.push(kf(q)); var aa = Df(p, Cf(t), Cf(O));
			l && (p = new N(g, h, b), aa = aa || p); if(!aa) throw new H("No slot size for availableWidth=" + a);
			p = jd(248, ld, function() { a: { var b = aa; var g = l; var k = m;g = void 0 === g ? !1 : g;k = void 0 === k ? !1 : k; if(f) { if(e.gfwrnh) { var p = C(e.gfwrnh); if(p) { g = { H: new Bf(a, p), G: !0 }; break a } } if(gf(d, c) && !k) g = { H: new Bf(a, b.height()), G: 101 };
						else { b = a / 1.2;
							k = k ? Infinity : lf(c, d);
							k = Math.min(b, k); if(k < .5 * b || 100 > k) k = b;
							g && (k = Math.max(k, h));
							g = { H: new Bf(a, Math.floor(k)), G: k < b ? 102 : !0 } } } else g = { H: b, G: 100 } } return g }); return { H: p.H, G: p.G, aa: b, wa: k } },
		Kf = function(a, b) { if("auto" == a) return 1; switch(b) {
				case 2:
					return 2;
				case 1:
					return 3;
				case 4:
					return 4;
				case 3:
					return 5;
				case 6:
					return 6;
				case 5:
					return 7;
				case 7:
					return 8 } throw Error("bad mask"); },
		Nf = function(a) { return function(b) { return !(320 == b.minWidth() && (a && 50 == b.height() || !a && 100 == b.height())) } }; var Of = { "image-top": function(a) { return 600 >= a ? 284 + .414 * (a - 250) : 429 }, "image-middle": function(a) { return 500 >= a ? 196 - .13 * (a - 250) : 164 + .2 * (a - 500) }, "image-side": function(a) { return 500 >= a ? 205 - .28 * (a - 250) : 134 + .21 * (a - 500) }, "text-only": function(a) { return 500 >= a ? 187 - .228 * (a - 250) : 130 }, "in-article": function(a) { return 420 >= a ? a / 1.2 : 460 >= a ? a / 1.91 + 130 : 800 >= a ? a / 4 : 200 } },
		Pf = function(a, b) { M.call(this, a, b) };
	ia(Pf, M);
	Pf.prototype.j = function() { return Math.min(1200, this.minWidth()) }; var Qf = function(a, b, c, d, e) { var f = e.google_ad_layout || "image-top"; if("in-article" == f && "false" != e.google_full_width_responsive) { var g = $e(b, c, a, .2); if(!0 !== g) e.gfwrnwer = g;
			else if(g = I(b)) { e.google_full_width_responsive_allowed = !0; var h = c.parentElement; if(h) { b: for(var l = c, m = 0; 100 > m && l.parentElement; ++m) { for(var k = l.parentElement.childNodes, q = 0; q < k.length; ++q) { var r = k[q]; if(r != l && df(b, r)) break b } l = l.parentElement;
						l.style.width = "100%";
						l.style.height = "auto" } ef(b, c, h, a, g, e);a = g } } } if(250 > a) throw new H("Fluid responsive ads must be at least 250px wide: availableWidth=" + a);
		b = Math.min(1200, Math.floor(a)); if(d && "in-article" != f) { f = Math.ceil(d); if(50 > f) throw new H("Fluid responsive ads must be at least 50px tall: height=" + f); return new Q(11, new M(b, f)) } if("in-article" != f && (d = e.google_ad_layout_key)) { f = "" + d;
			d = Math.pow(10, 3); if(c = (e = f.match(/([+-][0-9a-z]+)/g)) && e.length) { a = []; for(g = 0; g < c; g++) a.push(parseInt(e[g], 36) / d);
				d = a } else d = null; if(!d) throw new H("Invalid data-ad-layout-key value: " + f);
			f = (b + -725) / 1E3;
			e = 0;
			c = 1;
			a = d.length; for(g = 0; g < a; g++) e += d[g] * c, c *= f;
			f = Math.ceil(1E3 * e - -725 + 10); if(isNaN(f)) throw new H("Invalid height: height=" + f); if(50 > f) throw new H("Fluid responsive ads must be at least 50px tall: height=" + f); if(1200 < f) throw new H("Fluid responsive ads must be at most 1200px tall: height=" + f); return new Q(11, new M(b, f)) } d = Of[f]; if(!d) throw new H("Invalid data-ad-layout value: " + f);
		d = Math.ceil(d(b)); return new Q(11, "in-article" == f ? new Pf(b, d) : new M(b, d)) }; var U = function(a, b) { M.call(this, a, b) };
	ia(U, M);
	U.prototype.j = function() { return this.minWidth() };
	U.prototype.m = function(a) { return M.prototype.m.call(this, a) + "_0ads_al" }; var Rf = [new U(728, 15), new U(468, 15), new U(200, 90), new U(180, 90), new U(160, 90), new U(120, 90)],
		Sf = function(a, b, c, d) { var e = 90;
			d = void 0 === d ? 130 : d;
			e = void 0 === e ? 30 : e; var f = Df(Rf, ff(a)); if(!f) throw new H("No link unit size for width=" + a + "px");
			a = Math.min(a, 1200);
			f = f.height();
			b = Math.max(f, b);
			a = (new Q(10, new U(a, Math.min(b, 15 == f ? e : d)))).j;
			b = a.minWidth();
			a = a.height();
			15 <= c && (a = c); return new Q(10, new U(b, a)) },
		Tf = function(a, b, c, d) { if(!E(b, je.u)) return a; var e = bf(a, b, c); if(!0 !== e) return d.google_full_width_responsive_allowed = !1, d.gfwrnwer = e, a;
			e = I(b); if(!e) return a;
			d.google_full_width_responsive_allowed = !0;
			ef(b, c, c.parentElement, a, e, d); return e }; var Uf = function(a, b, c, d, e) { var f;
		(f = I(b)) ? 488 > I(b) ? b.innerHeight >= b.innerWidth ? (e.google_full_width_responsive_allowed = !0, ef(b, c, c.parentElement, a, f, e), f = { w: f, A: !0 }) : f = { w: a, A: 5 } : f = { w: a, A: 4 }: f = { w: a, A: 10 }; var g = f;
		f = g.w;
		g = g.A; if(!0 !== g || a == f) return new Q(12, new M(a, d), null, !0, g, 100);
		a = Jf(f, "auto", b, c, e, !0, a, d, !1, !1); return new Q(12, a.H, a.aa, !0, g, a.G) }; var Vf = function(a) { var b = a.google_ad_format; if("autorelaxed" == b) return vf(a) ? 9 : 5; if(Mf(b)) return 1; if("link" == b) return 4; if("fluid" == b) return 8 },
		Xf = function(a, b, c, d, e) { e = b.offsetWidth || (c.google_ad_resize || (void 0 === e ? !1 : e)) && P(b, d, "width", C) || c.google_ad_width || 0; var f = Wf(a, e, b, c, d);
			f || (f = c.google_resizing_allowed, f = Lf(e, c.google_ad_format, d, b, c, f, f));
			f.j.l(d, e, c, b);
			nf(f, e, c);
			1 != a && (a = f.j.height(), b.style.height = a + "px") },
		Wf = function(a, b, c, d, e) { var f = d.google_ad_height || P(c, e, "height", C); switch(a) {
				case 5:
					return a = jd(247, ld, function() { return If(b, d.google_ad_format, e, c, d) }), f = a.w, a = a.A, !0 === a && b != f && ef(e, c, c.parentElement, b, f, d), !0 === a ? d.google_full_width_responsive_allowed = !0 : (d.google_full_width_responsive_allowed = !1, d.gfwrnwer = a), zf(f, d);
				case 9:
					return Af(b, d);
				case 4:
					return a = Tf(b, e, c, d), Sf(a, mf(e, c), f, D(e, he.ca) ? 250 : 190);
				case 8:
					return Qf(b, e, c, f, d);
				case 10:
					return Uf(b, e, c, f, d) } };
	(function(a) { var b = { msg_type: /^[a-zA-Z0-9_-]+$/ },
			c = function(a) { a.B && (b[a.name] = a.B) };
		$b(nc, c); for(var d = 0; d < oc.length; d++) c(oc[d]); for(d = 0; d < a.length; d++) c(a[d]); return new wd(b) })([]); var Yf = function(a, b, c) { c || (c = Sb ? "https" : "http");
		n.location && "https:" == n.location.protocol && "http" == c && (c = "https"); return [c, "://", a, b].join("") }; var Zf = function(a, b, c, d, e) { d = void 0 === d ? "" : d; var f = a.createElement("link");
		f.rel = c;
		v(c.toLowerCase(), "stylesheet") ? b = gb(b) : b instanceof fb ? b = gb(b) : b instanceof ib ? b instanceof ib && b.constructor === ib && b.sa === hb ? b = b.$ : (ra(b), b = "type_error:SafeUrl") : (b instanceof ib || (b = b.la ? b.j() : String(b), jb.test(b) || (b = "about:invalid#zClosurez"), b = kb(b)), b = b.j());
		f.href = b;
		d && "preload" == c && (f.as = d);
		e && (f.nonce = e); if(a = a.getElementsByTagName("head")[0]) try { a.appendChild(f) } catch(g) {} }; var $f = /^(\d+)x(\d+)(|_[a-z]*)$/,
		ag = function(a) { return E(a, "165767636") }; var V = function(a) { this.s = [];
			this.l = a || window;
			this.j = 0;
			this.m = null;
			this.N = 0 },
		bg;
	V.prototype.O = function(a, b) { 0 != this.j || 0 != this.s.length || b && b != window ? this.v(a, b) : (this.j = 2, this.F(new cg(a, window))) };
	V.prototype.v = function(a, b) { this.s.push(new cg(a, b || this.l));
		dg(this) };
	V.prototype.R = function(a) { this.j = 1; if(a) { var b = kd(188, wa(this.C, this, !0));
			this.m = this.l.setTimeout(b, a) } };
	V.prototype.C = function(a) { a && ++this.N;
		1 == this.j && (null != this.m && (this.l.clearTimeout(this.m), this.m = null), this.j = 0);
		dg(this) };
	V.prototype.T = function() { return !(!window || !Array) };
	V.prototype.P = function() { return this.N }; var dg = function(a) { var b = kd(189, wa(a.W, a));
		a.l.setTimeout(b, 0) };
	V.prototype.W = function() { if(0 == this.j && this.s.length) { var a = this.s.shift();
			this.j = 2; var b = kd(190, wa(this.F, this, a));
			a.j.setTimeout(b, 0);
			dg(this) } };
	V.prototype.F = function(a) { this.j = 0;
		a.l() }; var eg = function(a) { try { return a.sz() } catch(b) { return !1 } },
		fg = function(a) { return !!a && ("object" === typeof a || "function" === typeof a) && eg(a) && ac(a.nq) && ac(a.nqa) && ac(a.al) && ac(a.rl) },
		gg = function() { if(bg && eg(bg)) return bg; var a = sd(),
				b = a.google_jobrunner; return fg(b) ? bg = b : a.google_jobrunner = bg = new V(a) },
		hg = function(a, b) { gg().nq(a, b) },
		ig = function(a, b) { gg().nqa(a, b) };
	V.prototype.nq = V.prototype.O;
	V.prototype.nqa = V.prototype.v;
	V.prototype.al = V.prototype.R;
	V.prototype.rl = V.prototype.C;
	V.prototype.sz = V.prototype.T;
	V.prototype.tc = V.prototype.P; var cg = function(a, b) { this.l = a;
		this.j = b }; var jg = function(a, b) { var c = jc(b); if(c) { c = I(c); var d = B(a, b) || {},
				e = d.direction; if("0px" === d.width && "none" != d.cssFloat) return -1; if("ltr" === e && c) return Math.floor(Math.min(1200, c - a.getBoundingClientRect().left)); if("rtl" === e && c) return a = b.document.body.getBoundingClientRect().right - a.getBoundingClientRect().right, Math.floor(Math.min(1200, c - a - Math.floor((c - b.document.body.clientWidth) / 2))) } return -1 }; var lg = function(a) { var b = this;
		this.j = a;
		a.google_iframe_oncopy || (a.google_iframe_oncopy = { handlers: {}, upd: function(a, d) { var c = kg("rx", a);
				a: { if(a && (a = a.match("dt=([^&]+)")) && 2 == a.length) { a = a[1]; break a } a = "" } a = (new Date).getTime() - a;
				c = c.replace(/&dtd=(\d+|-?M)/, "&dtd=" + (1E5 <= a ? "M" : 0 <= a ? a : "-M"));
				b.set(d, c); return c } });
		this.l = a.google_iframe_oncopy };
	lg.prototype.set = function(a, b) { var c = this;
		this.l.handlers[a] = b;
		this.j.addEventListener && this.j.addEventListener("load", function() { var b = c.j.document.getElementById(a); try { var e = b.contentWindow.document; if(b.onload && e && (!e.body || !e.body.firstChild)) b.onload() } catch(f) {} }, !1) }; var kg = function(a, b) { var c = new RegExp("\\b" + a + "=(\\d+)"),
				d = c.exec(b);
			d && (b = b.replace(c, a + "=" + (+d[1] + 1 || 1))); return b },
		mg = La("var i=this.id,s=window.google_iframe_oncopy,H=s&&s.handlers,h=H&&H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&&d&&(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}"); var ng = { '"': '\\"', "\\": "\\\\", "/": "\\/", "\b": "\\b", "\f": "\\f", "\n": "\\n", "\r": "\\r", "\t": "\\t", "\x0B": "\\u000b" },
		og = /\uffff/.test("\uffff") ? /[\\"\x00-\x1f\x7f-\uffff]/g : /[\\"\x00-\x1f\x7f-\xff]/g,
		pg = function() {},
		rg = function(a, b, c) { switch(typeof b) {
				case "string":
					qg(b, c); break;
				case "number":
					c.push(isFinite(b) && !isNaN(b) ? String(b) : "null"); break;
				case "boolean":
					c.push(String(b)); break;
				case "undefined":
					c.push("null"); break;
				case "object":
					if(null == b) { c.push("null"); break } if(b instanceof Array || void 0 != b.length && b.splice) { var d = b.length;
						c.push("["); for(var e = "", f = 0; f < d; f++) c.push(e), rg(a, b[f], c), e = ",";
						c.push("]"); break } c.push("{");
					d = ""; for(e in b) b.hasOwnProperty(e) && (f = b[e], "function" != typeof f && (c.push(d), qg(e, c), c.push(":"), rg(a, f, c), d = ","));
					c.push("}"); break;
				case "function":
					break;
				default:
					throw Error("Unknown type: " + typeof b); } },
		qg = function(a, b) { b.push('"');
			b.push(a.replace(og, function(a) { if(a in ng) return ng[a]; var b = a.charCodeAt(0),
					c = "\\u";
				16 > b ? c += "000" : 256 > b ? c += "00" : 4096 > b && (c += "0"); return ng[a] = c + b.toString(16) }));
			b.push('"') }; var sg = {},
		tg = (sg.google_ad_modifications = !0, sg.google_analytics_domain_name = !0, sg.google_analytics_uacct = !0, sg),
		ug = function(a) { a.google_page_url && (a.google_page_url = String(a.google_page_url)); var b = [];
			$b(a, function(a, d) { if(null != a) { try { var c = [];
						rg(new pg, a, c); var f = c.join("") } catch(g) {} f && (f = f.replace(/\//g, "\\$&"), bc(b, d, "=", f, ";")) } }); return b.join("") }; var xg = function() { var a = n;
			this.l = a = void 0 === a ? n : a;
			this.v = "https://securepubads.g.doubleclick.net/static/3p_cookie.html";
			this.j = 2;
			this.m = [];
			this.s = !1;
			a: { a = xb(!1, 50); var b = ub(n);b && a.unshift(b);a.unshift(n); var c; for(b = 0; b < a.length; ++b) try { var d = a[b],
						e = vg(d); if(e) { this.j = wg(e); if(2 != this.j) break a;!c && A(d) && (c = d) } } catch(f) {} this.l = c || this.l } },
		zg = function(a) { if(2 != yg(a)) { for(var b = 1 == yg(a), c = 0; c < a.m.length; c++) try { a.m[c](b) } catch(d) {} a.m = [] } },
		Ag = function(a) { var b = vg(a.l);
			b && 2 == a.j && (a.j = wg(b)) },
		yg = function(a) { Ag(a); return a.j },
		Cg = function(a) { var b = Bg;
			b.m.push(a); if(2 != b.j) zg(b);
			else if(b.s || (Ub(b.l, "message", function(a) { var c = vg(b.l); if(c && a.source == c && 2 == b.j) { switch(a.data) {
							case "3p_cookie_yes":
								b.j = 1; break;
							case "3p_cookie_no":
								b.j = 0 } zg(b) } }), b.s = !0), vg(b.l)) zg(b);
			else { a = nb(new mb(b.l.document), "IFRAME");
				a.src = b.v;
				a.name = "detect_3p_cookie";
				a.style.visibility = "hidden";
				a.style.display = "none";
				a.onload = function() { Ag(b);
					zg(b) }; try { b.l.document.body.appendChild(a) } catch(c) {} } },
		vg = function(a) { return a.frames && a.frames[Sa("detect_3p_cookie")] || null },
		wg = function(a) { return Gb(a, "3p_cookie_yes") ? 1 : Gb(a, "3p_cookie_no") ? 0 : 2 }; var Dg = /^\.google\.(com?\.)?[a-z]{2,3}$/,
		Eg = /\.(cn|com\.bi|do|sl|ba|by|ma)$/,
		Fg = function(a) { return Dg.test(a) && !Eg.test(a) },
		Gg = n,
		Bg, Hg = function(a) { a = "https://" + ("adservice" + a + "/adsid/integrator.js"); var b = ["domain=" + encodeURIComponent(n.location.hostname)];
			W[3] >= +new Date && b.push("adsid=" + encodeURIComponent(W[1])); return a + "?" + b.join("&") },
		W, X, Ig = function() { Gg = n;
			W = Gg.googleToken = Gg.googleToken || {}; var a = +new Date;
			W[1] && W[3] > a && 0 < W[2] || (W[1] = "", W[2] = -1, W[3] = -1, W[4] = "", W[6] = "");
			X = Gg.googleIMState = Gg.googleIMState || {};
			Fg(X[1]) || (X[1] = ".google.com"); "array" == ra(X[5]) || (X[5] = []);
			na(X[6]) || (X[6] = !1); "array" == ra(X[7]) || (X[7] = []);
			u(X[8]) || (X[8] = 0) },
		Y = { Z: function() { return 0 < X[8] }, ya: function() { X[8]++ }, za: function() { 0 < X[8] && X[8]-- }, Aa: function() { X[8] = 0 }, Ka: function() { return !1 }, ka: function() { return X[5] }, ia: function(a) { try { a() } catch(b) { n.setTimeout(function() { throw b; }, 0) } }, oa: function() { if(!Y.Z()) { var a = n.document,
						b = function(b) { b = Hg(b);
							a: { try { var c = tb(); break a } catch(h) {} c = void 0 }
							var d = c;
							Zf(a, b, "preload", "script", d);
							c = a.createElement("script");
							c.type = "text/javascript";
							d && (c.nonce = d);
							c.onerror = function() { return n.processGoogleToken({}, 2) };
							b = rb(b);
							lb(c, b); try {
								(a.head || a.body || a.documentElement).appendChild(c), Y.ya() } catch(h) {} },
						c = X[1];
					b(c); ".google.com" != c && b(".google.com");
					b = {}; var d = (b.newToken = "FBT", b);
					n.setTimeout(function() { return n.processGoogleToken(d, 1) }, 1E3) } } },
		Jg = function(a) { Ig(); var b = Gg.googleToken[5] || 0;
			a && (0 != b || W[3] >= +new Date ? Y.ia(a) : (Y.ka().push(a), Y.oa()));
			W[3] >= +new Date && W[2] >= +new Date || Y.oa() },
		Kg = function(a) { n.processGoogleToken = n.processGoogleToken || function(a, c) { var b = a;
				b = void 0 === b ? {} : b;
				c = void 0 === c ? 0 : c;
				a = b.newToken || ""; var e = "NT" == a,
					f = parseInt(b.freshLifetimeSecs || "", 10),
					g = parseInt(b.validLifetimeSecs || "", 10),
					h = b["1p_jar"] || "";
				b = b.pucrd || "";
				Ig();
				1 == c ? Y.Aa() : Y.za(); var l = Gg.googleToken = Gg.googleToken || {},
					m = 0 == c && a && ma(a) && !e && u(f) && 0 < f && u(g) && 0 < g && ma(h);
				e = e && !Y.Z() && (!(W[3] >= +new Date) || "NT" == W[1]); var k = !(W[3] >= +new Date) && 0 != c; if(m || e || k) e = +new Date, f = e + 1E3 * f, g = e + 1E3 * g, 1E-5 > Math.random() && Yb("https://pagead2.googlesyndication.com/pagead/gen_204?id=imerr&err=" + c, void 0), l[5] = c, l[1] = a, l[2] = f, l[3] = g, l[4] = h, l[6] = b, Ig(); if(m || !Y.Z()) { c = Y.ka(); for(a = 0; a < c.length; a++) Y.ia(c[a]);
					c.length = 0 } };
			Jg(a) },
		Lg = function(a) { Bg = Bg || new xg;
			Cg(function(b) { b && a() }) }; var Z = Sa("script"),
		Pg = function() { var a = D(z, re.V),
				b = D(z, re.U) || a;
			b && z.google_sa_impl && !z.document.getElementById("google_shimpl") && (z.google_sa_queue = null, z.google_sl_win = null, z.google_sa_impl = null);
			b && !z.google_sa_queue && (z.google_sa_queue = [], z.google_sl_win = z, z.google_process_slots = function() { return Mg(z, !a) }, b = Ng(), Zf(z.document, b, "preload", "script"), b = document.createElement("IFRAME"), b.id = "google_shimpl", b.style.display = "none", z.document.documentElement.appendChild(b), Pe(z, "google_shimpl", "<!doctype html><html><body>" + ("<" + Z + ">") + "google_sailm=true;google_sl_win=window.parent;google_async_iframe_id='google_shimpl';" + ("</" + Z + ">") + Og() + "</body></html>"), b.contentWindow.document.close()) },
		Mg = kd(215, function(a, b, c) { c = void 0 === c ? +new Date : c; var d = a.google_sa_queue,
				e = d.shift();
			sa(e) && jd(216, ld, e);
			d.length && (b || 50 < +new Date - c ? a.setTimeout(function() { return Mg(a, b) }, 0) : Mg(a, b, c)) }),
		Og = function(a) { return ["<", Z, ' src="', Ng(void 0 === a ? "/show_ads_impl.js" : a), '"></', Z, ">"].join("") },
		Ng = function(a) { a = void 0 === a ? "/show_ads_impl.js" : a; var b = Rb ? "https" : "http";
			a: { if(Pb) try { var c = z.google_cafe_host || z.top.google_cafe_host; if(c) { var d = c; break a } } catch(e) {} d = Mb("", "pagead2.googlesyndication.com") }
			return Yf(d, ["/pagead/js/", Ob(), "/r20180425", a, ""].join(""), b) },
		Qg = function(a, b, c, d) { return function() { var e = !1;
				d && gg().al(3E4); try { Pe(a, b, c), e = !0 } catch(g) { var f = sd().google_jobrunner;
					fg(f) && f.rl() } e && (e = kg("google_async_rrc", c), (new lg(a)).set(b, Qg(a, b, e, !1))) } },
		Rg = function(a) { var b = ["<iframe"];
			$b(a, function(a, d) { null != a && b.push(" " + d + '="' + La(a) + '"') });
			b.push("></iframe>"); return b.join("") },
		Tg = function(a, b, c) { Sg(a, b, c, function(a, b, f) { a = a.document; for(var d = b.id, e = 0; !d || a.getElementById(d);) d = "aswift_" + e++;
				b.id = d;
				b.name = d;
				d = Number(f.google_ad_width);
				e = Number(f.google_ad_height); var l = f.ds || "";
				l && (l += l.endsWith(";") ? "" : ";");
				16 == f.google_reactive_ad_format ? (f = a.createElement("div"), a = Oe(b, d, e, l), f.innerHTML = a, c.appendChild(f.firstChild)) : (f = Oe(b, d, e, l), c.innerHTML = f); return b.id }) },
		Ug = function(a) { if(D(a, re.U) || D(a, re.V)) return "<" + Z + ">window.parent.google_sa_impl({iframeWin: window, pubWin: window.parent});</" + Z + ">"; var b = "<" + Z + ">window.google_process_slots=function(){window.google_sa_impl({iframeWin: window, pubWin: window.parent});" + ("};</" + Z + ">");
			a = D(a, ue.u) ? Og("/show_ads_impl_le.js") : D(a, ue.o) ? Og("/show_ads_impl_le_c.js") : Og(); return b + a },
		Sg = function(a, b, c, d) { var e = {},
				f = b.google_ad_width,
				g = b.google_ad_height;
			null != f && (e.width = f && '"' + f + '"');
			null != g && (e.height = g && '"' + g + '"');
			e.frameborder = '"0"';
			e.marginwidth = '"0"';
			e.marginheight = '"0"';
			e.vspace = '"0"';
			e.hspace = '"0"';
			e.allowtransparency = '"true"';
			e.scrolling = '"no"';
			e.allowfullscreen = '"true"';
			e.onload = '"' + mg + '"';
			d = d(a, e, b);
			f = b.google_ad_output;
			e = b.google_ad_format;
			g = b.google_ad_width || 0; var h = b.google_ad_height || 0;
			e || "html" != f && null != f || (e = g + "x" + h);
			f = !b.google_ad_slot || b.google_override_format || !cb[b.google_ad_width + "x" + b.google_ad_height] && "aa" == b.google_loader_used;
			e && f ? e = e.toLowerCase() : e = "";
			b.google_ad_format = e; if(!u(b.google_reactive_sra_index) || !b.google_ad_unit_key) { e = [b.google_ad_slot, b.google_orig_ad_format || b.google_ad_format, b.google_ad_type, b.google_orig_ad_width || b.google_ad_width, b.google_orig_ad_height || b.google_ad_height];
				f = [];
				g = 0; for(h = c; h && 25 > g; h = h.parentNode, ++g) 9 === h.nodeType ? f.push("") : f.push(h.id);
				(f = f.join()) && e.push(f);
				b.google_ad_unit_key = Ab(e.join(":")).toString();
				e = []; for(f = 0; c && 25 > f; ++f) { g = (g = 9 !== c.nodeType && c.id) ? "/" + g : "";
					a: { if(c && c.nodeName && c.parentElement) { h = c.nodeName.toString().toLowerCase(); for(var l = c.parentElement.childNodes, m = 0, k = 0; k < l.length; ++k) { var q = l[k]; if(q.nodeName && q.nodeName.toString().toLowerCase() === h) { if(c === q) { h = "." + m; break a }++m } } } h = "" } e.push((c.nodeName && c.nodeName.toString().toLowerCase()) + g + h);
					c = c.parentElement } c = e.join() + ":";
				e = a;
				f = []; if(e) try { var r = e.parent; for(g = 0; r && r !== e && 25 > g; ++g) { var p = r.frames; for(h = 0; h < p.length; ++h)
							if(e === p[h]) { f.push(h); break }
						e = r;
						r = e.parent } } catch(O) {} b.google_ad_dom_fingerprint = Ab(c + f.join()).toString() } var t;
			r = b.google_ad_client; if(!Qe) b: { p = xb(); for(c = 0; c < p.length; c++) try { if(t = p[c].frames.google_esf) { Qe = t; break b } } catch(O) {} Qe = null } Qe ? t = "" : (t = { style: "display:none" }, /[^a-z0-9-]/.test(r) ? t = "" : (t["data-ad-client"] = Ne(r), t.id = "google_esf", t.name = "google_esf", t.src = Yf(Tb(), ["/pagead/html/", Ob(), "/r20180425/zrt_lookup.html#"].join("")), t = Rg(t)));
			r = t;
			t = D(a, re.U) || D(a, re.V);
			e = D(a, ze.u);
			p = za;
			c = (new Date).getTime();
			b.google_lrv = Ob();
			e ? (e = "google_pub_vars=" + ("window.parent['google_sv_map']['" + d + "'];"), b.google_unique_id = ec(a), b.google_start_time = p, b.google_bpp = c > p ? c - p : 1, b.google_async_rrc = 0, a.google_sv_map = a.google_sv_map || {}, a.google_sv_map[d] = b) : e = [ug(b), "google_unique_id=" + ec(a) + ";", "google_start_time=" + p + ";", "google_bpp=" + (c > p ? c - p : 1) + ";", "google_async_rrc=0;"].join("");
			a.google_t12n_vars = ae;
			r = ["<!doctype html><html><body>", r, "<" + Z + ">", e, "google_sailm=true;", t ? "google_sl_win=window.parent;" : "", "google_iframe_start_time=new Date().getTime();", 'google_async_iframe_id="' + d + '";', "</" + Z + ">", Ug(a), "</body></html>"].join("");
			b = a.document.getElementById(d) ? hg : ig;
			d = Qg(a, d, r, !0);
			t ? (a.google_sa_queue = a.google_sa_queue || [], a.google_sa_impl ? b(d) : a.google_sa_queue.push(d)) : b(d) },
		Vg = function(a, b) { var c = navigator; if(a && b && c && (a = a.document, c = Ne(b), !/[^a-z0-9-]/.test(c))) { var d = Da("r20160913");
				d && (d += "/");
				b = a.createElement("script");
				lb(b, rb(Yf("pagead2.googlesyndication.com", "/pub-config/" + d + c + ".js")));
				(a = a.getElementsByTagName("script")[0]) && a.parentNode && a.parentNode.insertBefore(b, a) } }; var Wg = function(a, b, c) { for(var d = a.attributes, e = d.length, f = 0; f < e; f++) { var g = d[f]; if(/data-/.test(g.name)) { var h = Da(g.name.replace("data-matched-content", "google_content_recommendation").replace("data", "google").replace(/-/g, "_")); if(!b.hasOwnProperty(h)) { g = g.value; var l = {};
					l = (l.google_reactive_ad_format = Kb, l.google_allow_expandable_ads = Fb, l);
					g = l.hasOwnProperty(h) ? l[h](g, null) : g;
					null === g || (b[h] = g) } } } if(c.document && c.document.body && !Vf(b) && !b.google_reactive_ad_format && (d = parseInt(a.style.width, 10), e = jg(a, c), 0 < e && d > e))
			if(f = parseInt(a.style.height, 10), d = !!cb[d + "x" + f], D(c, ne.X)) b.google_ad_resize = 0;
			else { h = e; if(d)
					if(g = db(e, f)) h = g, b.google_ad_format = g + "x" + f + "_0ads_al";
					else throw Error("TSS=" + e);
				b.google_ad_resize = 1;
				b.google_ad_width = h;
				d || (b.google_ad_format = null, b.google_override_format = !0);
				e = h;
				a.style.width = e + "px";
				f = Lf(e, "auto", c, a, b);
				h = e;
				f.j.l(c, h, b, a);
				nf(f, h, b);
				f = f.j;
				b.google_responsive_formats = null;
				f.minWidth() > e && !d && (b.google_ad_width = f.minWidth(), a.style.width = f.minWidth() + "px") }
		d = b.google_reactive_ad_format; if(!b.google_enable_content_recommendations || 1 != d && 2 != d) { d = a.offsetWidth || P(a, c, "width", C) || b.google_ad_width || 0;
			a: { e = xa(Lf, d, "auto", c, a, b, !0, !0);f = D(c, "182982000");h = D(c, "182982100"); try { var m = c.localStorage.getItem("google_adsense_labs"); var k = 0 <= Aa(m.split(","), "11") } catch(q) { k = !1 } if(!(f || h || k) || ! of () || b.google_reactive_ad_format || Vf(b) || Ue(a, b) || 1 == b.google_ad_resize) k = !1;
				else { for(k = a; k; k = k.parentElement)
						if(m = B(k, c), (h = !m) || (h = !(0 <= Aa(["static", "relative"], m.position))), h) { k = !1; break a }
					b.google_resizing_allowed = !0;
					f ? (k = {}, nf(e(), d, k), b.google_resizing_width = k.google_ad_width, b.google_resizing_height = k.google_ad_height, k.ds && (b.ds = k.ds)) : b.google_ad_format = "auto";
					k = !0 } }
			if(m = Vf(b)) Xf(m, a, b, c, k);
			else { if(Ue(a, b)) { if(k = B(a, c)) a.style.width = k.width, a.style.height = k.height, Te(k, b);
					b.google_ad_width || (b.google_ad_width = a.offsetWidth);
					b.google_ad_height || (b.google_ad_height = a.offsetHeight);
					b.google_loader_features_used = 256;
					k = Wb(c);
					b.google_responsive_auto_format = k ? k.data && "rspv" == k.data.autoFormat ? 13 : 14 : 12 } else Te(a.style, b), b.google_ad_output && "html" != b.google_ad_output || 300 != b.google_ad_width || 250 != b.google_ad_height || (k = a.style.width, a.style.width = "100%", m = a.offsetWidth, a.style.width = k, b.google_available_width = m);
				E(c, "153762914") || E(c, "153762975") || E(c, "164692081") || ag(c) ? (b.google_resizing_allowed = !1, k = !0) : k = !1; if(k && (m = a.parentElement)) { k = b.google_ad_format; if(d = $f.test(k) || !k) { d = jc(c); if(!(e = null == d || b.google_reactive_ad_format)) { e = I(d); if(!(d = !(488 > e && 320 < e) || !(d.innerHeight >= d.innerWidth) || Ye(m, c))) a: { b: { d = m; for(e = 0; 100 > e && d; e++) { if((f = B(d, c)) && v(f.display, "table")) { d = !0; break b } d = d.parentElement } d = !1 } if(d)
									for(d = m, e = !1, f = 0; 100 > f && d; f++) { h = d.style; if("auto" == h.margin || "auto" == h.marginLeft || "auto" == h.marginRight) e = !0; if(e) { d = !0; break a } d = d.parentElement } d = !1 } e = d } d = (e ? !1 : !0) && We(a, c) } if(d && (d = a.offsetWidth || parseInt(a.style.width, 10) || b.google_ad_width, e = I(c)) && (f = B(m, c)) && (f = cf(f, e, d), g = f.na, h = f.direction, f = f.ja, !(5 > f || .4 < f / e))) { f = b.google_resizing_allowed = !0; if(E(c, "164692081") || ag(c)) f = Ze(m, c);
						m = -1 * (Jb(m) + g) + "px"; if(E(c, "153762975") || ag(c)) "rtl" == h ? a.style.marginRight = m : a.style.marginLeft = m, a.style.width = e + "px", a.style.zIndex = 1932735282;
						m = "";
						h = parseInt(a.offsetHeight || a.style.height || b.google_ad_height, 10);
						k && (k = k.match($f), m = k[3], h = parseInt(k[2], 10));
						f && ag(c) && (k = d / h, 1.15 < k && (Ve(a, c) < xd(c).clientHeight || (h = 3 > k ? Math.round(5 * e / 6) : Math.round(h * e / d)))); if(E(c, "153762975") || ag(c)) b.google_ad_format = e + "x" + h + m, b.google_ad_width = e, b.google_ad_height = h, a.style.height = h + "px";
						b.google_resizing_width = e;
						b.google_resizing_height = h;
						Me(c, "153762914", "153762975", "164692081", "165767636") && (b.ds = "outline:thick dashed #f0f !important;") } } 12 == b.google_responsive_auto_format && "true" == b.google_full_width_responsive ? Xf(10, a, b, c, !1) : D(c, ge.u) && 12 == b.google_responsive_auto_format && (a = bf(a.offsetWidth || parseInt(a.style.width, 10) || b.google_ad_width, c, a), !0 !== a ? (b.efwr = !1, b.gfwrnwer = a) : b.efwr = !0) } } else b.google_ad_width = I(c), b.google_ad_height = 50, a.style.display = "none" }; var Xg = !1,
		Yg = 0,
		Zg = !1,
		$g = !1,
		ah = function(a) { return ic.test(a.className) && "done" != a.getAttribute("data-adsbygoogle-status") },
		ch = function(a, b) { var c = window;
			a.setAttribute("data-adsbygoogle-status", "done");
			bh(a, b, c) },
		bh = function(a, b, c) { var d = hc();
			d.google_spfd || (d.google_spfd = Wg);
			(d = b.google_reactive_ads_config) || Wg(a, b, c); if(!dh(a, b, c)) { if(d) { if(Xg) { if(d.page_level_pubvars && d.page_level_pubvars.pltais) return; throw new H("Only one 'enable_page_level_ads' allowed per page."); } Xg = !0 } else b.google_ama || dc(c);
				Zg || (Zg = !0, Vg(c, b.google_ad_client));
				$b(tg, function(a, d) { b[d] = b[d] || c[d] });
				b.google_loader_used = "aa";
				b.google_reactive_tag_first = 1 === Yg; if((d = b.google_ad_output) && "html" != d && "js" != d) throw new H("No support for google_ad_output=" + d);
				jd(164, ld, function() { Tg(c, b, a) }) } },
		dh = function(a, b, c) { var d = b.google_reactive_ads_config; if(d) { var e = d.page_level_pubvars;
				e = (ta(e) ? e : {}).google_tag_origin } if(b.google_ama || "js" === b.google_ad_output) return !1; var f = e || b.google_tag_origin;
			e = ma(a.className) && /(\W|^)adsbygoogle-noablate(\W|$)/.test(a.className); var g = b.google_ad_slot; var h = c.google_ad_modifications;!h || lc(h.ad_whitelist, g, f) ? h = null : (f = h.space_collapsing || "none", h = (g = lc(h.ad_blacklist, g)) ? { ga: !0, pa: g.space_collapsing || f } : h.remove_ads_by_default ? { ga: !0, pa: f } : null); if(h && h.ga && "on" != b.google_adtest && !e) return a.className += " adsbygoogle-ablated-ad-slot", "slot" == h.pa && (null !== Eb(a.getAttribute("width")) && a.setAttribute("width", 0), null !== Eb(a.getAttribute("height")) && a.setAttribute("height", 0), a.style.width = "0px", a.style.height = "0px"), !0; if((e = B(a, c)) && "none" == e.display && !("on" == b.google_adtest || 0 < b.google_reactive_ad_format || d)) return c.document.createComment && a.appendChild(c.document.createComment("No ad requested because of display:none on the adsbygoogle tag")), !0;
			a = null == b.google_pgb_reactive || 3 === b.google_pgb_reactive; return 1 !== b.google_reactive_ad_format && 8 !== b.google_reactive_ad_format || !a ? !1 : (n.console && n.console.warn("Adsbygoogle tag with data-reactive-ad-format=" + b.google_reactive_ad_format + " is deprecated. Check out page-level ads at https://www.google.com/adsense"), !0) },
		eh = function(a) { for(var b = document.getElementsByTagName("ins"), c = 0, d = b[c]; c < b.length; d = b[++c]) { var e = d; if(ah(e) && "reserved" != e.getAttribute("data-adsbygoogle-status") && (!a || d.id == a)) return d } return null },
		fh = function(a, b) { b.tag_partner && (kc(n, b.tag_partner), kc(a, b.tag_partner)) },
		gh = function(a) { if(!$g) { $g = !0; try { var b = n.localStorage.getItem("google_ama_config") } catch(t) { b = null } try { var c = b ? new wc(b ? JSON.parse(b) : null) : null } catch(t) { c = null } if(b = c)
					if(c = Za(b, xc, 3), !c || y(c, 1) <= +new Date) try { n.localStorage.removeItem("google_ama_config") } catch(t) { pd(n, { lserr: 1 }) } else { Ya(b, 10) && (c = n.google_ad_modifications = n.google_ad_modifications || {}, c.remove_ads_by_default = !0, c.space_collapsing = "slot"); try { var d = Xa(b, 5); if(0 < d.length) { var e = new zc,
									f = d || [];
								2 < e.v ? e.l[2 + e.s] = f : (Va(e), e.m[2] = f); var g = e } else b: { f = n.location.pathname; var h = $a(b, zc, 7);e = {}; for(d = 0; d < h.length; ++d) { var l = y(h[d], 1);
									u(l) && !e[l] && (e[l] = h[d]) } for(var m = f.replace(/(^\/)|(\/$)/g, "");;) { var k = Ab(m); if(e[k]) { g = e[k]; break b } if(!m) { g = null; break b } m = m.substring(0, m.lastIndexOf("/")) } }
							var q; if(q = g) a: { var r = Xa(g, 2); if(r)
									for(g = 0; g < r.length; g++)
										if(1 == r[g]) { q = !0; break a }
								q = !1 }
							if(q) { var p = new Qd;
								(new Ud(new Md(a, b), p)).start();
								p.l.then(xa(Wd, n), xa(Xd, n)) } } catch(t) { pd(n, { atf: -1 }) } } } },
		hh = function() { var a = document.createElement("INS");
			a.className = "adsbygoogle";
			a.className += " adsbygoogle-noablate";
			a.style.display = "none"; return a },
		ih = function(a) { var b = {};
			$b(mc, function(c, d) {!1 === a.enable_page_level_ads ? b[d] = !1 : a.hasOwnProperty(d) && (b[d] = a[d]) });
			ta(a.enable_page_level_ads) && (b.page_level_pubvars = a.enable_page_level_ads); var c = hh();
			bb.body.appendChild(c); var d = {};
			d = (d.google_reactive_ads_config = b, d.google_ad_client = a.google_ad_client, d);
			ch(c, d) },
		jh = function(a) { var b = jc(window); if(!b) throw new H("Page-level tag does not work inside iframes.");
			b.google_reactive_ads_global_state || (b.google_reactive_ads_global_state = new Yd);
			b.google_reactive_ads_global_state.wasPlaTagProcessed = !0;!bb.body || "complete" != bb.readyState && "interactive" != bb.readyState && E(z, Ae) ? Ub(bb, "DOMContentLoaded", kd(191, function() { ih(a) })) : ih(a) },
		lh = function(a) { var b = {};
			jd(165, md, function() { kh(a, b) }, function(c) { c.client = c.client || b.google_ad_client || a.google_ad_client;
				c.slotname = c.slotname || b.google_ad_slot;
				c.tag_origin = c.tag_origin || b.google_tag_origin }) },
		kh = function(a, b) { za = (new Date).getTime();
			a: { if(void 0 != a.enable_page_level_ads) { if(ma(a.google_ad_client)) { var c = !0; break a } throw new H("'google_ad_client' is missing from the tag config."); } c = !1 }
			if(c) 0 === Yg && (Yg = 1), fh(b, a), gh(a.google_ad_client), jh(a);
			else { 0 === Yg && (Yg = 2);
				c = a.element;
				(a = a.params) && $b(a, function(a, c) { b[c] = a }); if("js" === b.google_ad_output) { n.google_ad_request_done_fns = n.google_ad_request_done_fns || [];
					n.google_radlink_request_done_fns = n.google_radlink_request_done_fns || []; if(b.google_ad_request_done) { if(!sa(b.google_ad_request_done)) throw new H("google_ad_request_done parameter must be a function.");
						n.google_ad_request_done_fns.push(b.google_ad_request_done);
						delete b.google_ad_request_done;
						b.google_ad_request_done_index = n.google_ad_request_done_fns.length - 1 } else throw new H("google_ad_request_done parameter must be specified."); if(b.google_radlink_request_done) { if(!sa(b.google_radlink_request_done)) throw new H("google_radlink_request_done parameter must be a function.");
						n.google_radlink_request_done_fns.push(b.google_radlink_request_done);
						delete b.google_radlink_request_done;
						b.google_radlink_request_done_index = n.google_radlink_request_done_fns.length - 1 } a = hh();
					n.document.documentElement.appendChild(a);
					c = a } if(c) { if(!ah(c) && (c.id ? c = eh(c.id) : c = null, !c)) throw new H("'element' has already been filled."); if(!("innerHTML" in c)) throw new H("'element' is not a good DOM element."); } else if(c = eh(), !c) throw new H("All ins elements in the DOM with class=adsbygoogle already have ads in them.");
				ch(c, b) } },
		nh = function() { id();
			jd(166, nd, mh) },
		mh = function() { var a = Xb(Wb(z)) || z;
			Le(a);
			fd(D(z, me.D) || D(z, ke.D) || D(z, ke.ba));
			Pg(); if(D(z, ve.fa) || D(z, ve.Y) || D(z, ve.ea) || D(z, ve.da)) Ig(), Fg(".google.cn") && (X[1] = ".google.cn"), D(z, ve.Y) ? (a = pb(), Lg(a), Kg(a)) : Kg(null);
			D(z, we.u) && (a = vd() ? Mb("", "pagead2.googlesyndication.com") : Tb(), Zf(hc().document, a, "preconnect"));
			a = window.adsbygoogle; if(!a || !a.loaded) { var b = { push: lh, loaded: !0 }; try { Object.defineProperty(b, "requestNonPersonalizedAds", { set: oh }), Object.defineProperty(b, "pauseAdRequests", { set: ph }), Object.defineProperty(b, "onload", { set: qh }) } catch(e) {} a && (void 0 !== a.requestNonPersonalizedAds && (b.requestNonPersonalizedAds = a.requestNonPersonalizedAds), void 0 !== a.pauseAdRequests && (b.pauseAdRequests = a.pauseAdRequests)); if(a && a.shift) try { for(var c, d = 20; 0 < a.length && (c = a.shift()) && 0 < d;) lh(c), --d } catch(e) { throw window.setTimeout(nh, 0), e; } window.adsbygoogle = b;
				a && (b.onload = a.onload) } },
		oh = function(a) {+a ? Hb("GoogleSetNPA") : Ib("GoogleSetNPA") },
		ph = function(a) {+a ? Hb("GooglePauseAdRequests") : Ib("GooglePauseAdRequests") },
		qh = function(a) { ac(a) && window.setTimeout(a, 0) };
	nh(); }).call(this);