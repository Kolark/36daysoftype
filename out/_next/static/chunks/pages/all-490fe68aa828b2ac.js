(self.webpackChunk_N_E=self.webpackChunk_N_E||[]).push([[599],{669:function(e,r,n){(window.__NEXT_P=window.__NEXT_P||[]).push(["/all",function(){return n(8137)}])},8137:function(e,r,n){"use strict";n.r(r),n.d(r,{__N_SSG:function(){return p},default:function(){return v}});var t=n(5893),a=n(1664),o=n(2544),i=n.n(o),u=n(7294),s=n(6447),c=n(9365),l=n(8626),f=n(9477);function d(e,r,n){return r in e?Object.defineProperty(e,r,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[r]=n,e}function m(e){l.L.preload("/gltfCompressed/"+e.model);var r=(0,u.useRef)(),n=(0,u.useRef)(),a=(0,l.L)("/gltfCompressed/"+e.model),o=a.nodes,i=(a.materials,(0,u.useRef)()),c=(0,u.useRef)([0,0]),m=new f.ShaderMaterial({uniforms:{time:{value:0}},vertexShader:e.vertexShader,fragmentShader:e.fragmentShader,side:f.DoubleSide});(0,s.xQ)((function(e){var n=e.clock;i.current.material.uniforms.time.value=n.getElapsedTime(),r.current&&(r.current.rotation.x=(c.current[1]/window.innerHeight-.5)*Math.PI,r.current.rotation.y=(c.current[0]/window.innerWidth-.5)*Math.PI)})),(0,u.useEffect)((function(){window.addEventListener("mousemove",(function(e){c.current=[e.x,e.y]}))}));var h=Object.values(o).filter((function(e){return void 0!=e.geometry})),p=h.shift(),v=h.map((function(e){return(0,t.jsx)("mesh",{geometry:e.geometry,material:m},e.id)}));return(0,t.jsx)("group",function(e){for(var r=1;r<arguments.length;r++){var n=null!=arguments[r]?arguments[r]:{},t=Object.keys(n);"function"===typeof Object.getOwnPropertySymbols&&(t=t.concat(Object.getOwnPropertySymbols(n).filter((function(e){return Object.getOwnPropertyDescriptor(n,e).enumerable})))),t.forEach((function(r){d(e,r,n[r])}))}return e}({ref:r},e.groups,{dispose:null,children:(0,t.jsxs)("group",{ref:n,position:[-.75,-.75,.1],rotation:[Math.PI/2,0,0],scale:.01,children:[(0,t.jsx)("mesh",{ref:i,geometry:null===p||void 0===p?void 0:p.geometry,material:m}),v]})}))}var h=function(){var e=(0,s.Ky)(),r=e.camera,n=e.gl;return(0,u.useEffect)((function(){var e=new c.z(r,n.domElement);e.maxDistance=4,e.minDistance=4,e.enablePan=!1,e.enableRotate=!1,e.enableZoom=!1,e.reset()})),(0,t.jsx)(t.Fragment,{})};var p=!0,v=function(e){var r=e.page;return(0,t.jsxs)("div",{className:i().main,children:[(0,t.jsx)("div",{className:i().return,children:(0,t.jsx)(a.default,{href:"/",children:(0,t.jsx)("a",{children:(0,t.jsx)("h2",{children:"return"})})})}),(0,t.jsxs)(s.Xz,{orthographic:!0,camera:{zoom:120},children:[(0,t.jsx)(h,{}),(0,t.jsx)(u.Suspense,{fallback:null,children:r.shaders.map((function(e){return(0,t.jsx)(m,{vertexShader:e.vertexShader,fragmentShader:e.fragmentShader,model:e.model,groups:e.groupProps},e.letter)}))})]})]})}},2544:function(e){e.exports={main:"Letter_main__lRoa4",overlay:"Letter_overlay__Wlpxw",temp:"Letter_temp__2_aK1",return:"Letter_return__USuQM"}}},function(e){e.O(0,[737,476,774,888,179],(function(){return r=669,e(e.s=r);var r}));var r=e.O();_N_E=r}]);