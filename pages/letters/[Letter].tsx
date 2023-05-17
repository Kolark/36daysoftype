import Head from 'next/head';
import styles from "../../src/styles/Letter.module.css";
import * as THREE from 'three';

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
      const controls = new OrbitControls(camera, gl.domElement);
      controls.maxDistance = 4;
      controls.minDistance = 1;
      // controls.position0 = new THREE.Vector3(-10,0,80);
      
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

export default function Page({page}:any) {

  const groupProps : GroupProps =
  {
    position :[0, 0, 0],
  }

  return (
    <main className={styles.main}>
    <Canvas >
      
      <Camera/>
        <Suspense fallback={null}>
          <LetterContent vertexShader={page.vertex} fragmentShader={page.frag} model={page.model} groups={groupProps} scale={page.scale} offset={page.positionOffset} />
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
  return {paths, fallback: false};
}

export async function getStaticProps({params} : any) {
  const currentPath = params.Letter;
  const pageFound:any = content.pages.find(page => page.letter === currentPath);
  if(pageFound === undefined){
    return {notFound: true}
  }
  let previous ="";
  let next="";
  const index = content.pages.findIndex(page => page.letter === currentPath);
  if((index - 1)>=0){
    previous = content.pages[index-1].letter;
  }
  if(index+1 < content.pages.length){
    next = content.pages[index+1].letter;
  }


  const vertexShader : any =   await import("../../src/Shaders/" + pageFound.shader +"/vertex.glsl");
  const fragmentShader : any = await import("../../src/Shaders/" + pageFound.shader +"/fragment.glsl");

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

