import type { NextPage } from 'next'
import Head from 'next/head'
import Image from 'next/image'
import Link from 'next/link'
import styles from "../src/styles/Letter.module.css";
import React, { Suspense, useEffect, useRef, useState } from 'react';
import content from "../public/content.json";
import { Canvas, GroupProps, useFrame, useThree } from '@react-three/fiber';
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import LetterContent from "../src/LettersContent/LetterModel_all";
import { Vector3 } from 'three';
import { OrthographicCamera } from '@react-three/drei';

const Camera = () => {
  const { camera, gl } = useThree();
  useEffect(
    () => {
      const controls = new OrbitControls(camera, gl.domElement);
      controls.maxDistance = 4;
      controls.minDistance = 4;
      controls.enablePan = false;
      controls.enableRotate = false;
      controls.enableZoom = false;
      controls.reset();
    }
  );
  return (
<></>
  );
};

const Sphere = () => {
  return (
    <mesh>
      <sphereBufferGeometry args={[0.15, 10, 10]} />
      <meshNormalMaterial/>
    </mesh>
  );
};

// const useMouseMove = (onMouseMove) => {
//   useEffect(() => {
//       document.addEventListener("mousemove", onMouseMove)

//       return () => {
//           document.removeEventListener("mousemove", onMouseMove)
//       }
//   }, [onMouseMove])
// }

// const LetterWrapper = ({info}) => {

//   useFrame(({clock})=>{
//     // @ts-ignore
//     info.groupProps.rotation.y = clock.getElapsedTime();
//   });

//   return (
//     <LetterContent vertexShader={info.vertexShader} fragmentShader={info.fragmentShader} model={info.model} groups={info.groupProps} />
//   )
// }

const All: NextPage = ({page}:any) => {

  // useMouseMove(e => {

  //   // do something with e.clientX and e.clientY
  // });

  return (
    <div className={styles.main}>
        <div className={styles.return}>
        <Link href="/36daysoftype">
            <a><h2>return</h2></a>
        </Link>
        </div>
      <Canvas orthographic camera={{zoom:120}}>
        <Camera />
        <Suspense fallback={null}>
          {page.shaders.map((p:any)=><LetterContent key={p.letter} vertexShader={p.vertexShader} fragmentShader={p.fragmentShader} model={p.model} groups={p.groupProps} />)}
        </Suspense>
      </Canvas>
    </div>
  )
}

type ModelInfo = {
  groupProps : GroupProps,
  letter : string,
  model : string,
  vertexShader : string,
  fragmentShader: string,
}

type PageProps = {
  shaders : ModelInfo[]
}

export async function getStaticProps(path : any) {

  let shadersInfo : Promise<ModelInfo>[] = content.pages.map((p,i)=>GetShader(p,i));

  const page : PageProps = { shaders : await Promise.all(shadersInfo) };
  return {props:{page}};
}


async function GetShader(page:any,index:number):Promise<ModelInfo> {

  let vShader = await import(`../src/Shaders/${page.shader}/vertex.glsl`);
  let fShader = await import(`../src/Shaders/${page.shader}/fragment.glsl`);
  const colAmount = 9;
  const xPos = index % colAmount;
  const yPos = -Math.floor(index/colAmount);
  const groupProps : GroupProps =
  {
    position : [(xPos-colAmount/2)*2 + 0.75, yPos*2.5 + 3.75, 0],
    rotation:[0,0,0],
    scale: [1,1,1]
  }

  return {
    groupProps:groupProps,
    letter : page.letter,
    model : page.model,
    vertexShader : vShader.default,
    fragmentShader : fShader.default
  }
}

function GetPos(index:number) : Vector3 {return new Vector3(index % 6,Math.round(index/6)*2.0,0);}

export default All


