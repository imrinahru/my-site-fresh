---
title: Thoughts on Thesis
date: 2025-10-06
tags:
  - idea
draft: true
---
## Concept

#physicality #materiality #process #human-machine

Thesis: Digital fabrication/creative coding in the form of craft/art

the tragedy of craft/art movement: It unintentionally/intentionally let mass production absorbing craft/art to meet the need of machine and digitization

Hypothesis: Human is habitant of the analog, machine is habitant of the digital (inside analog, which may or may not inside digital...). Once a human practice is completely digitized, automated (irremediably altered to digital), it loses part of the capacity to speak to human.
In our digital time, the analog is something we experience in moments of fleeting temporality, it's the contour we feel around things.
When digital fabrication/creative coding, its tool and media retains the capacity to oscillate back and forth between the analog and the digital, it transcends as a form of craft that we instinctively long for. 

It is not record and replay, as the replay only follows digital prescription. In a proper oscillating state, digital materiality should be present along with an analog contour and that their presentation constantly oscillate in between, depending on how people look at it. 

How people perceive "digital"? Digital material qualities, What makes them interesting to people?
..Perfectness
..Randomness (work in both direction, analogness and digitalness)
..Mathematical
..Variation

How about a digital code-based motion video that looks really real, more real than the madeleine in Proust
Analog and digital are so intertwined, that the division in terms of medium is not enough/sometimes useless
A new definition of analog to digital: "perceptive/emotional" analog/digital
providing an alternative human-machine interaction

User research idea: Image of both extremes can be imagined, but what are the qualities of artifacts that sit in between?

What is interesting about digital vs analog?
- **Digital** = discrete, countable, repeatable (pixels, threads, tokens), separated, formatted, organized.
- **Analog** = continuous, flowing, perceptual (contours, shimmer, sound).



Media and tools:
#riso #laser-cutting #3d-printing #cnc-milling #pcb #cyanotype #arduino #electronics #moire 


Rhizomatic
http://farsight.cifs.dk/towards-a-rhizomatic-future/
a rhizome is a botanical term describing the roots of certain plants. Instead of sprouting in a vertical, tree-like fashion, rhizomes shoot horizontally, seemingly at random, and at times connecting to the roots of other plants through their nodes. Examples of rhizomes are the roots of potatoes and ginger plants. What is important is that rhizomatic structures are neither fixed to a particular space nor grow in a pre-determined way. They are instead defined by nodes (points of attachment), and their subsequent networks, the roots connecting each node to one another, creating a complex and decentralised rhizomatic structure.

Rhizomatic thinking understands objects through their relative difference to other objects: the colour green, for example, is not understood as striving towards an abstract greenness, but instead by how it differs from red or yellow. This emphasises a heterogeneous colour theory, insisting that the more difference two objects have from one another, the more can be understood about them – a breeding ground for innovation.

The core aim of online hypertext – text which contains links to another text such as on Wikipedia – is what sociologist Hubert Dreyfus calls “intertextual evolution”,  where knowledge is not found or displayed hierarchically via classification, but by a loosely networked form of diversification created by users of the internet themselves. “Old library culture” is contrasted with “hyperlinked culture”; arborescent thinking with rhizomatic.


> [!NOTE] Thesis writing thoughts
> A rhizomatic, hyper-linked concepts that in the end connect well together, and present another total image that is different from the individual node, or the sum of those nodes in literal sense.


The idea is that the organisation of nature blossoms in a variety of different ways, each with their own metaphorical counterpart in society.

The reductionism of previous eras is challenged by concepts such as complexity theory, which aims to analyse systems based on their interrelatedness rather than their constituent parts.


Reference

Tiling
https://paulbourke.net/geometry/tilingplane/


### 1st Experiment: PCB that combine hand-drawn aesthetic with digital topology

- can be at a larger scale, statue-like, and the magnetic particles run across it, a door (a piece of functional existence)
- or change the conventional material to fabric material with embroidery
- process: 
- 
	1. Research topoR, generate an efficient circuit
	2. Add aesthetic element found in hand-drawn circuit https://oldcrap.org/
		https://oldcrap.org/2020/06/18/panasonic-nv-8200-vcr/
		https://oldcrap.org/2019/10/20/atari-sm124-monitor/
	3. Try this circuit: [Analog from BEAM Robotics](https://www.instructables.com/BEAM-Solar-Powered-Pummer-Heart-Shaped-PCB/)
	4. Try to etch/ print
	5. Enlarge to a statue, try kinetic mechanisms, or
	6. Draw on a scaled piece of cloth? like that of Amazonian pattern, that people sing along side the drawing

Variation: Multi-layered statue of PCB
![[Pasted image 20251010180235.png]]

![[Pasted image 20251008171613.png]]
![[Pasted image 20251008171706.png]]
![[Pasted image 20251008171731.png]]
![[Pasted image 20251008171745.png]]
![[Pasted image 20251008171756.png]]
![[Pasted image 20251008171815.png]]
https://www.instructables.com/Making-a-Hand-Drawn-PCB./

![[UCSC-CRL-92-39.pdf]]

![[rubber_band_PCB_design.pdf]]

![[out.pdf]]

### 2nd Experiment: riso

Process:
1. Use p5.js to create a smooth animation of moire pattern with an layout, can have 3 different patterns
2. Output every frame as 4 separate gray-scale stencils, with name CMYK (letter size)
3. Print using Riso
4. Aim for 12 FPS, so in total, if I were to make a 30sec short film, I'll need to print 12* 30=360
5. Compile into a stop-motion film

Additionally: try to contribute to the plug-in

https://www.itsnicethat.com/articles/hiromu-oka-hodo-station-process-animation-051222
https://www.riso.co.jp/learn/uta/2203-spring/creators.html


### 3rd Experiment: Laser cut

Create grids of clear acrylics
Process:
1. Create digital parts as vector image (A->D)
2. laser cut using eco-friendly material (D->A)
3. paint or use film for coloring (A)
4. animate using stop-motion (A->D)

Confirming the process

https://youtu.be/a4RsOIBer5M?si=rlWaQE89SRwKwxUw
![[Pasted image 20251008175659.png]]
![[Pasted image 20251008175709.png]]
![[Pasted image 20251008175725.png]]
![[Pasted image 20251008175819.png]]
![[Pasted image 20251008175837.png]]

![[Pasted image 20251008175915.png]]
![[Pasted image 20251008175936.png]]
![[Pasted image 20251008180042.png]]
![[Pasted image 20251008180057.png]]
![[Pasted image 20251008180200.png]]
![[Pasted image 20251008180140.png]]
![[Pasted image 20251008180223.png]]


### 4th Experiment: cyanotype

Use digitally controlled UV light to create cyanotype image. 
In concept, you can just be the light source holder 

1. Create kinetic arms that can move UV light control its trajectory using G-code. Refer to below youtube and other related posts
2. use cyanotype paper held in place to capture the UV light trajectory (so the background should be white and the light is blue). Might need very tiny light/control the time to have a beautiful trajectory

https://youtu.be/1FfB7cLkUyQ?si=100Eef1dHW8a4b23

>  少しばかりカスタマイズして、チップに ESP32、ファームウェアに Grbl_ESP32 を使用。Bluetooth 越しに G コード制御できるようにした。

![[レコーディング 2025-10-08 181636.mp4]]

>  更に改造し、カメラ雲台の代わりに RGBLED がひっついた棒を取り付ける。Houdini で作ったスプラインアニメーションを G コード化し、バルブ撮影

![[レコーディング 2025-10-08 181852.mp4]]

Experiment 5: CNC mill

>  普段は不可視化されているGコードにもうひと工夫加えることで何か面白いことが出来ないかものか気になってきます。

> 出力する途中でツールを退避させるGコードを挟み込み、そして切削油のオンオフの出力をカメラのシャッターにつなげることでコマ撮りするとか。あるいはGコードの数値をランダムに足し引きすることで、出力の精度をあえて落としてみたり。

1. Research G-Code, find interesting coding change
2. Might not be ok to do in the studio, buy own CNC mill for it. https://www.originalmind.co.jp/products/kitmill_rz 
	https://youtu.be/QV_o-s_MRFw?si=vqBvsXoQy_HBF0y1 (maybe in the future)
	Genmitsu 4040 Pro Max Machine: [https://tidd.ly/4kCoTht](https://www.youtube.com/redirect?event=comments&redir_token=QUFFLUhqbVFvQWtxSkdUaXhnOTRsalZwRDl5Yk80NnFlQXxBQ3Jtc0trNlU2MmhkWmhHbk5LQUdPZ3ZUX1FETGYzRllvdFBsWmp6LVVuQWgxYmNuNm5HcnVzcGFmWGhEb3NMSmhqOFVJbmVUM0h2QWxXSmcyTDh1VXBVU2JYNUFIQ1ZDM3lTVkZaeWVwSERkbU5pNGpxM3Fkdw&q=https%3A%2F%2Ftidd.ly%2F4kCoTht) Genmitsu 4040 Pro Max Machine with Vectric: [https://tidd.ly/4lvltOQ](https://www.youtube.com/redirect?event=comments&redir_token=QUFFLUhqbUk3dk0zTmZEZUhBVktyWFBmLWk4Szdqa3BuUXxBQ3Jtc0ttMS15VnNmcWhoU19BNWRQaS1WMmduU3p2a0NZdGJBRmZfQTNmZ0FQSFBVWHFjbDhCdHpOZVJVaGdnMmM3UFhmWjV5S0F6ZDBybXpMaGMxbF9pZ0tYVmp2M0Q5SFNJUDRta0Z6UTNhamRONFdIclBjdw&q=https%3A%2F%2Ftidd.ly%2F4lvltOQ) Free Guide: Perfect Project Checklist - [https://thecncsidehustle.com/checklist/](https://www.youtube.com/redirect?event=comments&redir_token=QUFFLUhqbDI0OEV6c2h0bWs3X1FPY0dwQVJucloyRDBsUXxBQ3Jtc0tsN1FJSkM0WTNUeHozOEpxRThJUlhhVWMwcE1vM0ZRNVpiOTBUXzY5a2pUSVRrRUQwVjVzZTBuOExFNXp4VnRtYnJWTWpIYy1lYmFGRDEyVlgtZ3FHSUpsd3lkOWUycS1DNnF0aXJLYzdwdGdWVXNVQQ&q=https%3A%2F%2Fthecncsidehustle.com%2Fchecklist%2F) Kickstart Your CNC Skills - [https://thecncsidehustle.com/kickstart-waitlist/](https://www.youtube.com/redirect?event=comments&redir_token=QUFFLUhqazZ2YUdYMHVXanRjODFvbjduQUd3NkhQN21kZ3xBQ3Jtc0ttcHp1LThFWUdlS0xjU1cyZnBaOTJLWVhhcjlsYk9LbmIzYmFwT1BvenpOeHVDTG1YM254Q3ZzUEhvS3UybW5vS3B0eHIwaUJJODJJN2dBZmlLS05OR2phR0wwMm1MbnJCWTFiZUJyU2pNa0VZN2RrUQ&q=https%3A%2F%2Fthecncsidehustle.com%2Fkickstart-waitlist%2F) Free Guide: Pricing For Maximum Profits - [https://thecncsidehustle.com/pricing-...](https://www.youtube.com/redirect?event=comments&redir_token=QUFFLUhqbnh0QWdQZkdfR2RuRTNkcmRONVJIVTMtNTU2QXxBQ3Jtc0tuM01nNU1KenJQaGNMeTI5VGFUUENnOHhlZzNIc2NueG9lRjdBWWZhZ0gwS3lESjFCNmY2RkpkLXhHZFBtN3g0QWo2bmJEd1dMYkxhU0JFQjktd0ExYlBhZ3U0YTJDSEZhX0ozMGRYQlhXeVg1WjBZTQ&q=https%3A%2F%2Fthecncsidehustle.com%2Fpricing-...) Turn Your CNC Woodworking Into Income - [https://thecncsidehustle.com/special/](https://www.youtube.com/redirect?event=comments&redir_token=QUFFLUhqbGtnZ0JlZHFOaldvR05WSFNmN29aZXN1aFZRUXxBQ3Jtc0ttd2h0TTUyd1MzRWhmZXFkQ1FPTzRFT1VrVWE4dTEwQl90RDBYYTN5SEFCamstZ2FqS3k1V0htd3RlLTBiakhJdnVjbnYyRUdXVVp0c3ZfODlzWTVEMThZVV9pb3RtQk9JWDF3VTZEenpFdFdTUTFFaw&q=https%3A%2F%2Fthecncsidehustle.com%2Fspecial%2F)
	Or build your own
	https://www.youtube.com/watch?v=covhU4L5N5g
	![[Pasted image 20251008183826.png]]
3. Play with how material react to the tool, the pattern

Experiment 6: 3D printer

Try [[(WIP) Drawing agents]] through different shapes of the agents and its math behind it
Look at 10:00
https://www.youtube.com/watch?v=68JUaszsvmU
![[Pasted image 20251008185147.png]]
![[Pasted image 20251008185212.png]]
https://www.creativeapplications.net/project/filament-sculptures-by-lia-3d-printing-by-printhead-movement/
https://www.seditionart.com/magazine/interview-with-lia-painting-with-code
Read this!
https://liasomething.tumblr.com/

> [!NOTE] Showing the process
> Showing the end result can only goes so far, showing the process might be interesting. There are many different tools, ways as well, like p5.js, Da Vinci, filming techniques, cameras, kinetics..


> [!NOTE] Da Vince
> Need to look into Da Vinci for film-making.


> [!NOTE] Stop motion
> https://youtu.be/a4RsOIBer5M?si=rlWaQE89SRwKwxUw
> http://kijekadamski.com/
> https://youtu.be/4XXXlRcgBhs?si=_J2e4s7u-123leNI

> [!NOTE] G-Code
> https://marlinfw.org/meta/gcode/
> https://glisp.app/gcnc/introduction/getting-started
> https://github.com/Doridian/OpenBambuAPI/blob/main/gcode.md
> https://www.instructables.com/Trace-It-Drill-It-Build-It-Your-Guide-to-CNC-PCB-M/


> [!NOTE] PCB
> https://www.instructables.com/Glowing-Instrustables-Robot-Keychain-Made-From-PCB/
> [Analog from BEAM Robotics](https://www.instructables.com/BEAM-Solar-Powered-Pummer-Heart-Shaped-PCB/)


> [!NOTE] Light-based
> https://www.youtube.com/watch?v=HKpBhE7QVAI
> https://mitxela.com/projects/candle
> https://github.com/mitxela/candle


> [!NOTE] Coding
> https://postdigitalgraphicdesign.com/interview/17/pdgd-itw-caseyreas/

>  Another point is that the code is not the art. The code is not _it_. The code is a way of articulating ideas but there's nothing interesting, special or unique about the code. The true system exists on a level below the code. The code is the way that I can precisely articulate that idea but I could articulate each project in a half dozen different languages.

>  When you talk about long-form versus short-form, I've done a lot of short-form work over the years and in that work randomness can take a really strong role. Maybe one out of a thousand is like, “Wow!” and the rest are not as interesting. But when you get into needing everything that the system produces to be a viable work, then one of two things happens. Either you have a ton of different conditions in the code or you just temper and tune the randomness extremely well.   
‍

> For me, I use randomness in the same way that artists got excited about randomness over one hundred years ago: as a way of getting around my biases, getting around my taste. When I see something unexpected, I know it; it just hits me. So randomness is a really good technique to get to something that's really unexpected.
>  [Casey Reas](https://www.lerandom.art/editorial/casey-reas-on-the-history-of-generative-art-part-2)


## Materiality in Digital Fabrication

https://baku89.com/cnc-study
https://baku89.com/addsub

![[Thesis reference.mp4]]

- G コードの吐き方、CNC 用ファームウェアをより細かく制御したい
    - [PyCam](https://github.com/SebKuzminsky/pycam): a toolpath generator based on 3D or 3D models for 3-axis CNC machining.
    - [Grbl_ESP32](https://github.com/bdring/Grbl_Esp32), [FluidNC](https://github.com/bdring/FluidNC): よさげなファームウェア
    - [OpenBuilds](https://openbuilds.com/): 特殊な断面のアルミフレームをスライダー機構（V-Slot）に採用した、オープンソース・CNC・ハードウェア

https://www.youtube.com/@isaac879/videos
https://youtu.be/1FfB7cLkUyQ?si=4iN8W3L8C4bqMSNh
>  少しばかりカスタマイズして、チップに ESP32、ファームウェアに Grbl_ESP32 を使用。Bluetooth 越しに G コード制御できるようにした。

>  更に改造し、カメラ雲台の代わりに RGBLED がひっついた棒を取り付ける。Houdini で作ったスプラインアニメーションを G コード化し、バルブ撮影。

![[Thesis reference_kinetic.mp4]]

https://baku89.com/Jan%2028%EF%BC%8C%202025%EF%BC%9A%20(%C2%B1)%20%E3%83%9E%E3%82%B6%E3%83%BC%E3%83%9E%E3%82%B7%E3%83%B3

>  個人的に好きなCNCコマ撮りは、映像作家デュオの[Kijek/Adamski](https://kijekadamski.com/)によるトクマルシューゴのMV『Katachi』です。これはレーザーカッターをつかって人のシルエットや図形を一コマずつスチレンボードに切り出し、それを厚み方向に並べていくところをコマ撮りしています。映像というメディアは2次元の画像と 1つの時間次元からなる立体物として捉えることもできるのですが、それを文字通り物理的な3次元空間に配置している

https://youtu.be/a4RsOIBer5M?si=rlWaQE89SRwKwxUw
http://kijekadamski.com/
https://youtu.be/4XXXlRcgBhs?si=_J2e4s7u-123leNI

>  だけど一方で、CNCの使われ方というのは、工作機械としても映像制作のためのツールとしても、いつだってその「出力物」に主眼が置かれてたように思えます。これは個人でフライス盤や3Dプリンターを持っている人には共感してもらえると思うんですが、CNCの面白さってむしろその出力する過程にもあるんです。人間じゃ絶対思いつかないような書き順で、せっせとツールを動かし続けている様子は、どこか健気で中毒性があるんですよね。よう働いてくれてるなぁ〜って
>

>  CNCを動かす仕組みって実はめちゃくちゃ単純で、人でも読めるテキストファイルによって制御するんです。それこそ60年以上も変わっていなかったりします。

```
G90           ; 以後、絶対座標で動かして
G0 X100 Y1150 ; ツールをX=100mm, y=150mmの位置に動かして
G1 Z-5        ; ツールをちょい下げして
G1 X200 F1000 ; 1分間に1mの速さで、X=200mmまでゆっくり動かして
```

最近3Dプリンタ界隈を賑わせている4万円台のBambu Lab製品

>  大概のGコードは、人の手ではなく、専用のソフトウェアによって自動的に生成されます。フライス盤ではCAM（Computer Aided Manufacturing）、3Dプリンタでは[Slic3r](https://baku89.com/Slic3r)のようなスライサーアプリが使われています。こうしたツールのお陰で、ぼくら設計者は「どう軸を動かすか」ではなく、「どんな形を出力するか」という点に集中することができます。

>  ただCNCそのものに惹かれている身としては、普段は不可視化されているGコードにもうひと工夫加えることで何か面白いことが出来ないかものか気になってきます。例えば、出力する途中でツールを退避させるGコードを挟み込み、そして切削油のオンオフの出力をカメラのシャッターにつなげることでコマ撮りするとか。あるいはGコードの数値をランダムに足し引きすることで、出力の精度をあえて落としてみたり。その道具を使うにあたって注目するレイヤーを、出力したいモデルではなく、出力するための制御方法という一段低いレベルに下げてみることで、新しい工作機械の使い方が見えてくるような気がするんです。

>  CNCを組む要領で自分でカメラ用の6軸のスライダーを作ればいいじゃないかって。だから今回の映像で試したいことのエッセンスは「**CNCデバイスを、CNCとしてのカメラスライダーで取り囲み、CNC制御によって撮影する**」という入れ子構造にあったりします。

## Circuit design

https://youtu.be/euJgtLcWWyo?si=aeAN5_dKkE8MD9XV
> in the beginning printed circuit boards were designed by hand every connection was drawn with tape on a giant diagram which was then photographed scaled down and etched into copper because they were hand drawn there were no constraints and most boards from this era have a very unique aesthetic at early cad packages couldn't cope with your wires being at anything other than a multiple of 45 degrees as a result circuit boards from this era evolved into their own unique aesthetic the rigid robotic roots the cyber sci-fi style and it certainly is a style it's a look that says technology
> and this is the way it remained for decades it became culturally ingrained it became expected it became normal so normal that people forgot that the style was born from limitations
> it's not the 1980s anymore cad software in the current year can place tracks at arbitrary angles and indeed even wavy lines are possible modern cad software has subsumed many features of modern graphics software 
> if you break away from the grid you make your wires shorter and you can fit more components into the same size board this is taken to its most extreme with a tool called topora the topological auto router it models wires as rubber bands and
> generates a layout with the most efficient routing it is ruthlessly efficient every track is as short as it can be if you only care about functionality and not about aesthetics then every circuit board should look like this
![[Pasted image 20251008164237.png]]
![[Pasted image 20251008164254.png]]

https://oldcrap.org/
![[Pasted image 20251006055429.png]]
ease of designthe way cad software is written limiting yourself to 45 degree bends is simply
the easiest option if you want to quickly throw a design together you're not going to care about the corner style and more importantly if you want to edit a design or rearrange things then it's much easier if you haven't got rounded corners simply
because of the way the software was written
![[Pasted image 20251008164543.png]]
![[Pasted image 20251008164652.png]]
![[Pasted image 20251008164715.png]]
![[Pasted image 20251008164747.png]]
![[Pasted image 20251008164826.png]]



https://www.eremex.com/products/topor/
https://mitxela.com/projects/melting_kicad
http://mitxela.com/projects/melting_kicad_2
https://github.com/mitxela/kicad-round-tracks

## Using a physical filter
https://www.kenko-tokina.co.jp/imaging/filter/pl/

実験 1: 60 度ずつ回転させながら、3 枚撮影した写真の明度変化から、各ピクセルの偏光強度と偏角を計算。
![[Pasted image 20251006055712.png]]

Red, Blue, Green, 偏光強度, 偏光角度 の 5 チャンネル分でいろんな合成方法を試す。
![[Thesis reference_filter.mp4]]

1 軸分 CNC 制御できる基盤を設計し、カメラにマウント。動画から偏角を割り出すほうが、3 枚のみに比べてノイズが少なそう。

基盤に取り付けたボタンに以下のマクロを設定。
```
G91 ;; 座標指定をインクリメンタルに
M07 ;; ミストON （RECボタン押下）
G0 Y１ ;; 間隔を置くためのダミー
M09 ;; ミストOFF (RECボタンリリース)

G0 X200 ;; PLフィルターを180度 + 両端に加減速のバッファ10度 = 200度分回転

M07 ;; ミストON （RECボタン押下）
G0 Y１ ;; 間隔を置くためのダミー
M09 ;; ミストOFF (RECボタンリリース)
G90 ;; 座標を絶対指定に

```

![[Thesis reference_rig.mp4]]

## 3D Printer

>  - 品質の悪いプリント（吸湿での糸引き、オーバーハングのタレ）を意図的にアニメーションに活かす
- カメラを撮影時に手動制御で動かす（予めモーションパスを描かない）
- 多色印刷も気になる（[積彩](https://sekisai.com/)さん）

https://youtu.be/adNg_qpjX1Q?si=5eRy5MlmJWoz-uYG
https://manual.slic3r.org/advanced/command-line

## Presentation

>  - Stop-Motion + Audio/Visual + CNC
- 3Dプリンタとフライス盤の2種類の工作機械を用いた2つのコマ撮りアニメーション映像
    - **+** 3Dプリンタ= Additive manufacturing（加算, 付加製造）
    - **-** フライス盤 = Subtractive manufacturing （減算, 除去製造）
- 出力物を撮るのではなく、積層・切削する過程そのものをアニメーションとして魅せる
- CNCやGコードといった工作機械のための技術をモチーフとした作品
- 電子音楽に合わせて事細かにうごめくアニメーション。往年のAudio/Visual映像のような

## Pen Plotter
https://baku89.com/%E3%83%9A%E3%83%B3%E3%83%97%E3%83%AD%E3%83%83%E3%82%BF%E3%83%BC
https://www.amazon.co.jp/gp/product/B0BKLNV968/ref=ppx_yo_dt_b_asin_image_o00_s00?ie=UTF8&psc=1

https://kijekadamski.com/