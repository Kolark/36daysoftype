(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[405],{5301:function(e,t,r){(window.__NEXT_P=window.__NEXT_P||[]).push(["/",function(){return r(751)}])},8418:function(e,t,r){"use strict";function l(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,l=new Array(t);r<t;r++)l[r]=e[r];return l}function o(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var r=null==e?null:"undefined"!==typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var l,o,n=[],a=!0,s=!1;try{for(r=r.call(e);!(a=(l=r.next()).done)&&(n.push(l.value),!t||n.length!==t);a=!0);}catch(i){s=!0,o=i}finally{try{a||null==r.return||r.return()}finally{if(s)throw o}}return n}}(e,t)||function(e,t){if(!e)return;if("string"===typeof e)return l(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);"Object"===r&&e.constructor&&(r=e.constructor.name);if("Map"===r||"Set"===r)return Array.from(r);if("Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r))return l(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}t.default=void 0;var n,a=(n=r(7294))&&n.__esModule?n:{default:n},s=r(6273),i=r(387),f=r(7190);var d={};function c(e,t,r,l){if(e&&s.isLocalURL(t)){e.prefetch(t,r,l).catch((function(e){0}));var o=l&&"undefined"!==typeof l.locale?l.locale:e&&e.locale;d[t+"%"+r+(o?"%"+o:"")]=!0}}var u=function(e){var t,r=!1!==e.prefetch,l=i.useRouter(),n=a.default.useMemo((function(){var t=o(s.resolveHref(l,e.href,!0),2),r=t[0],n=t[1];return{href:r,as:e.as?s.resolveHref(l,e.as):n||r}}),[l,e.href,e.as]),u=n.href,h=n.as,p=e.children,_=e.replace,m=e.shallow,b=e.scroll,g=e.locale;"string"===typeof p&&(p=a.default.createElement("a",null,p));var v=(t=a.default.Children.only(p))&&"object"===typeof t&&t.ref,L=o(f.useIntersection({rootMargin:"200px"}),2),y=L[0],M=L[1],S=a.default.useCallback((function(e){y(e),v&&("function"===typeof v?v(e):"object"===typeof v&&(v.current=e))}),[v,y]);a.default.useEffect((function(){var e=M&&r&&s.isLocalURL(u),t="undefined"!==typeof g?g:l&&l.locale,o=d[u+"%"+h+(t?"%"+t:"")];e&&!o&&c(l,u,h,{locale:t})}),[h,u,M,g,r,l]);var O={ref:S,onClick:function(e){t.props&&"function"===typeof t.props.onClick&&t.props.onClick(e),e.defaultPrevented||function(e,t,r,l,o,n,a,i){("A"!==e.currentTarget.nodeName.toUpperCase()||!function(e){var t=e.currentTarget.target;return t&&"_self"!==t||e.metaKey||e.ctrlKey||e.shiftKey||e.altKey||e.nativeEvent&&2===e.nativeEvent.which}(e)&&s.isLocalURL(r))&&(e.preventDefault(),t[o?"replace":"push"](r,l,{shallow:n,locale:i,scroll:a}))}(e,l,u,h,_,m,b,g)},onMouseEnter:function(e){t.props&&"function"===typeof t.props.onMouseEnter&&t.props.onMouseEnter(e),s.isLocalURL(u)&&c(l,u,h,{priority:!0})}};if(e.passHref||"a"===t.type&&!("href"in t.props)){var x="undefined"!==typeof g?g:l&&l.locale,j=l&&l.isLocaleDomain&&s.getDomainLocale(h,x,l&&l.locales,l&&l.domainLocales);O.href=j||s.addBasePath(s.addLocale(h,x,l&&l.defaultLocale))}return a.default.cloneElement(t,O)};t.default=u},7190:function(e,t,r){"use strict";function l(e,t){(null==t||t>e.length)&&(t=e.length);for(var r=0,l=new Array(t);r<t;r++)l[r]=e[r];return l}function o(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var r=null==e?null:"undefined"!==typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null!=r){var l,o,n=[],a=!0,s=!1;try{for(r=r.call(e);!(a=(l=r.next()).done)&&(n.push(l.value),!t||n.length!==t);a=!0);}catch(i){s=!0,o=i}finally{try{a||null==r.return||r.return()}finally{if(s)throw o}}return n}}(e,t)||function(e,t){if(!e)return;if("string"===typeof e)return l(e,t);var r=Object.prototype.toString.call(e).slice(8,-1);"Object"===r&&e.constructor&&(r=e.constructor.name);if("Map"===r||"Set"===r)return Array.from(r);if("Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r))return l(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}Object.defineProperty(t,"__esModule",{value:!0}),t.useIntersection=function(e){var t=e.rootRef,r=e.rootMargin,l=e.disabled||!s,d=n.useRef(),c=o(n.useState(!1),2),u=c[0],h=c[1],p=o(n.useState(t?t.current:null),2),_=p[0],m=p[1],b=n.useCallback((function(e){d.current&&(d.current(),d.current=void 0),l||u||e&&e.tagName&&(d.current=function(e,t,r){var l=function(e){var t,r={root:e.root||null,margin:e.rootMargin||""},l=f.find((function(e){return e.root===r.root&&e.margin===r.margin}));l?t=i.get(l):(t=i.get(r),f.push(r));if(t)return t;var o=new Map,n=new IntersectionObserver((function(e){e.forEach((function(e){var t=o.get(e.target),r=e.isIntersecting||e.intersectionRatio>0;t&&r&&t(r)}))}),e);return i.set(r,t={id:r,observer:n,elements:o}),t}(r),o=l.id,n=l.observer,a=l.elements;return a.set(e,t),n.observe(e),function(){if(a.delete(e),n.unobserve(e),0===a.size){n.disconnect(),i.delete(o);var t=f.findIndex((function(e){return e.root===o.root&&e.margin===o.margin}));t>-1&&f.splice(t,1)}}}(e,(function(e){return e&&h(e)}),{root:_,rootMargin:r}))}),[l,_,r,u]);return n.useEffect((function(){if(!s&&!u){var e=a.requestIdleCallback((function(){return h(!0)}));return function(){return a.cancelIdleCallback(e)}}}),[u]),n.useEffect((function(){t&&m(t.current)}),[t]),[b,u]};var n=r(7294),a=r(9311),s="undefined"!==typeof IntersectionObserver;var i=new Map,f=[]},751:function(e,t,r){"use strict";r.r(t),r.d(t,{default:function(){return u}});var l=r(5893),o=r(9008),n=r(1664),a=r(6134),s=r.n(a),i=JSON.parse('{"L":[{"letter":"a","shader":"A_Shader","model":"A_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"b","shader":"B_Shader","model":"B_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"c","shader":"C_Shader","model":"C_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"d","shader":"D_Shader","model":"D_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"e","shader":"E_Shader","model":"E_Letter.glb","posOffset":[0.6,0.6,0],"scaleModifier":0.45},{"letter":"f","shader":"F_Shader","model":"F_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"g","shader":"G_Shader","model":"G_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"h","shader":"H_Shader","model":"H_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"i","shader":"I_Shader","model":"I_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"j","shader":"J_Shader","model":"J_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"k","shader":"K_Shader","model":"K_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"l","shader":"L_Shader","model":"L_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"m","shader":"M_Shader","model":"M_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"n","shader":"N_Shader","model":"N_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"o","shader":"O_Shader","model":"O_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"p","shader":"P_Shader","model":"P_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"q","shader":"Q_Shader","model":"Q_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"r","shader":"R_Shader","model":"R_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"s","shader":"S_Shader","model":"S_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"t","shader":"T_Shader","model":"T_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"u","shader":"U_Shader","model":"U_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"v","shader":"V_Shader","model":"V_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"w","shader":"W_Shader","model":"W_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"x","shader":"X_Shader","model":"X_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"y","shader":"Y_Shader","model":"Y_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"z","shader":"Z_Shader","model":"Z_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"0","shader":"0_Shader","model":"0_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"1","shader":"1_Shader","model":"1_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"2","shader":"2_Shader","model":"2_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"3","shader":"3_Shader","model":"3_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"4","shader":"4_Shader","model":"4_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"5","shader":"5_Shader","model":"5_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"6","shader":"6_Shader","model":"6_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"7","shader":"7_Shader","model":"7_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"8","shader":"8_Shader","model":"8_Letter.glb","posOffset":[0,0,0],"scaleModifier":1},{"letter":"9","shader":"9_Shader","model":"9_Letter.glb","posOffset":[0,0,0],"scaleModifier":1}]}'),f=r(5205),d=r.n(f);function c(e){return(0,l.jsx)(l.Fragment,{children:(0,l.jsx)("div",{className:d().letterBG,children:(0,l.jsx)(n.default,{href:"/letters/"+e.letter.toLowerCase(),children:(0,l.jsx)("a",{className:d().letterBox,children:e.letter})})})})}var u=function(){return(0,l.jsxs)("div",{className:s().container,children:[(0,l.jsxs)(o.default,{children:[(0,l.jsx)("title",{children:"Create Next App"}),(0,l.jsx)("meta",{name:"description",content:"Generated by create next app"}),(0,l.jsx)("link",{rel:"icon",href:"/favicon.ico"})]}),(0,l.jsxs)("main",{className:s().main,children:[(0,l.jsx)("div",{className:s().lettergrid,children:i.L.map((function(e){return(0,l.jsx)(c,{letter:e.letter.toUpperCase()},e.letter)}))}),(0,l.jsx)(n.default,{href:"/all",children:(0,l.jsx)("a",{children:(0,l.jsx)("h1",{className:s().all,children:(0,l.jsx)("u",{children:"See all letters"})})})})]})]})}},6134:function(e){e.exports={main:"Home_main__EtNt2",lettergrid:"Home_lettergrid__9TL95",all:"Home_all__zxP_D"}},5205:function(e){e.exports={letterBG:"LetterBox_letterBG__fU5b9",letterBox:"LetterBox_letterBox__kCzqu"}},9008:function(e,t,r){e.exports=r(5443)},1664:function(e,t,r){e.exports=r(8418)}},function(e){e.O(0,[774,888,179],(function(){return t=5301,e(e.s=t);var t}));var t=e.O();_N_E=t}]);