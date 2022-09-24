
import styles from "../../src/styles/Letter.module.css";

import * as THREE from 'three'
import ReactDOM from 'react-dom'

import React, { Suspense, useRef, useState } from 'react'
import { Canvas, useFrame } from '@react-three/fiber'

import LetterContent from "../../src/LettersContent/A_Content";
import Overlay from "../../src/components/Overlay";

export default function A(){
    return(
        <main className={styles.main}>
            <Canvas>
                <Suspense fallback={null}>
                  <LetterContent position={[-0.5, -0.5, 0]} />
                </Suspense>
            </Canvas>
            <div className={styles.overlay}>
              <Overlay />
            </div>
        </main>
    )
}



                {/* <ambientLight />
                <pointLight position={[10, 10, 10]} /> */}