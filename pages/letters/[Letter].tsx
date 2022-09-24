import Head from 'next/head';
import styles from "../../src/styles/Letter.module.css";
import * as THREE from 'three';
import ReactDOM from 'react-dom';
import React, { Suspense, useEffect, useRef, useState } from 'react';

import { Canvas, GroupProps, useThree } from '@react-three/fiber';
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

import LetterContent from "../../src/LettersContent/LetterModel";
import Overlay from "../../src/components/Overlay";
// @ts-ignore

import content from "../../public/content.json";

type PageProps = {
  previous:string,
  next:string,
  letter: string,
  vertex : string,
  frag: string,
  model: string,
  positionOffset:number[],
  scale: number
}

const Sphere = () => {
  return (
    <mesh>
      <sphereBufferGeometry args={[0.15, 10, 10]} />
      <meshNormalMaterial/>
    </mesh>
  );
};

const Camera = (props:any) => {
  const { camera, gl } = useThree();
  useEffect(
    () => {
      console.log(typeof(gl.domElement))
      
      const controls = new OrbitControls(camera, gl.domElement);
      controls.maxDistance = 1.5;
      controls.minDistance = 1;
      controls.enablePan = false;
      controls.enableRotate = true;
      controls.enableZoom = true;
      controls.reset();
    }
  );
  return (
<></>
  );
};

export default function Page({page}) {

  const groupProps : GroupProps =
  {
    position :[0, 0, 0],
  }
  const mycam = ()=><Camera/>;
   const myr = useRef(null);
   useEffect(()=>{
    console.log(myr.current);

   })

  return (
    <main className={styles.main}>
    <Canvas >
      <mycam />
      <Camera ref={myr}/>
        <Suspense fallback={null}>
          <LetterContent vertexShader={page.vertex} fragmentShader={page.frag} model={page.model} groups={groupProps} scale={page.scale} offset={page.positionOffset} />
        {/* <Sphere /> */}
        </Suspense>
    </Canvas>
    <div className={styles.overlay}>
      <Overlay previous={page.previous} next={page.next} />
    </div>
  </main>
  );
}

export async function getStaticPaths() {
  const paths = content.pages.map(page => {
    const Letter = page.letter;
    return {params: {Letter}};
  });
  return {paths, fallback: true};
}

export async function getStaticProps({params} : any) {
  const currentPath = params.Letter;
  const pageFound = content.pages.find(page => page.letter === currentPath) || {notfound: true};
  let previous ="";
  let next="";
  const index = content.pages.findIndex(page => page.letter === currentPath);
  if((index - 1)>=0){
    previous = content.pages[index-1].letter;
  }
  if(index+1 < content.pages.length){
    next = content.pages[index+1].letter;
  }


  const vertexShader = await import("../../src/shaders/" + pageFound.shader + "/vertex.glsl");
  const fragmentShader = await import("../../src/shaders/" + pageFound.shader+ "/fragment.glsl");

  const page : PageProps = {
    previous:previous,
    next:next,
    letter: pageFound.letter,
    vertex : vertexShader.default,
    frag: fragmentShader.default,
    model: pageFound.model,
    positionOffset:pageFound.posOffset,
    scale:pageFound.scaleModifier
  }
  return {props:{page}};
}

