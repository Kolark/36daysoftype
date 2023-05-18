import type { NextPage } from 'next'
import Head from 'next/head'
import Image from 'next/image'
import Link from 'next/link'
import styles from '../src/styles/Home.module.css'

import content from "../public/content.json";
import LetterBox from "../src/components/Letter";

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>Create Next App</title>
        <meta name="description" content="Generated by create next app" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <div className={styles.lettergrid}>
        {content.pages.map((p)=> <LetterBox key={p.letter} letter={p.letter.toUpperCase()} /> )}
        </div>
        <Link href={"/36daysoftype/all"}>
          <a>
        <h1 className={styles.all}><u>See all letters</u></h1>
          </a>
          </Link>
      </main>
    </div>
  )
}

export default Home
