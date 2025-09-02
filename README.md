# โครงงานเกม 2D  
วิชา CP352203 - Computer Game Development ภาคการศึกษาต้น ปีการศึกษา 2568  

## สมาชิกในกลุ่ม  
| รหัสนักศึกษา | ชื่อ-นามสกุล | Section |
|--------------|---------------|---------|
| 653380320-4  | กีรติพัทธ์ ไพศาลธนภัทร | CS2 |
| 653380195-1  | ณธฬ จันทร์หอม            | CS2 |

---

## ชื่อเกม  
**กำจัดจักรพรรดิชั่ว (Slay the Tyrant)**  

<img width="1918" height="1037" alt="image" src="https://github.com/user-attachments/assets/d9667874-84b1-4892-bf9a-826f7a868350" />


## ธีม หรือ แนวเกม  
- 2D Top-down Shooting (แนวคล้าย Vampire Survivor)  
- บรรยากาศแฟนตาซียุคกลาง  

---

## เนื้อเรื่องย่อ  
ในศักราชนิวเคีย ปีที่ 150 ณ จักรวรรดิกุญชร จักรพรรดิหัสดินที่ 3 ได้สวรรคตลง และจักรพรรดิหัสดินที่ 4 ก็ได้ขึ้นครองราชย์แทน  
ทว่า ด้วยนิสัยอันโหดเหี้ยมและชั่วร้ายของพระองค์ ทำให้จักรวรรดิเสื่อมโทรมลงอย่างรวดเร็ว ประชาชนถูกกดขี่และทนทุกข์ยากลำบาก  

จนกระทั่งมีนักรบผู้หนึ่ง ซึ่งเป็นโอรสนอกสมรสของจักรพรรดิหัสดินที่ 3 ลุกขึ้นเพื่อต่อต้านอำนาจของจักรพรรดิองค์ปัจจุบัน ด้วยความมุ่งมั่นที่จะโค่นล้มความอยุติธรรมและนำพาอาณาจักรกลับคืนสู่ความสงบสุข เขาจึงออกเดินทางต่อสู้กับเหล่าทหารและอสูรชั่วร้าย  

---

## รูปแบบการเล่น และกติกา  
- **W,A,S,D** : เคลื่อนที่  
- **Mouse Move** : เล็งทิศทางการยิง  
- **Left Click** : ยิงกระสุน  
- **ESC** : หยุดเกม / เปิดเมนู  

ผู้เล่นจะต้องเอาชีวิตรอดจากคลื่นศัตรูที่บุกเข้ามาเรื่อย ๆ โดยสามารถเก็บไอเทมเพื่อเพิ่มพลัง หรือบัฟความสามารถ เพื่อช่วยให้รอดจากศัตรูและต่อสู้กับบอสได้สำเร็จ  

---

## แนวคิดการออกแบบ  
- **กราฟิก** :  
  - 2D Pixel Art  
  - ธีมแฟนตาซียุคกลาง  
- **เสียง** :  
  - เพลงประกอบแบบวน เพื่อสร้างบรรยากาศให้ผู้เล่นดื่มด่ำไปกับเกม  
  - เอฟเฟกต์เสียงยิงปืน, โดนโจมตี, เก็บไอเทม ฯลฯ  

---

## กลุ่มเป้าหมาย (ผู้เล่น)  
- วัยรุ่นและนักศึกษา ที่ชอบเกมเล่นง่ายแต่ท้าทาย  
- ผู้ที่ชอบเกมแนวเอาชีวิตรอดจากศัตรูจำนวนมาก (Survivor-like)  
- ผู้ที่ชอบพัฒนาและสะสมความสามารถของตัวละคร  
- ผู้ที่ชอบเล่นเกมสั้น ๆ (Casual) แต่สามารถเล่นซ้ำหลายรอบเพื่อทำคะแนนหรือทำสถิติใหม่  

---

## การวิเคราะห์เกม AGE Analysis  

### Action  
- ควบคุมการเคลื่อนที่ด้วย W,A,S,D  
- เล็งการโจมตีด้วยเมาส์  
- ยิงศัตรูด้วยการคลิกซ้าย  
- เก็บไอเทมเพิ่มพลังและบัฟความสามารถ  

### Gameplay  
- เอาชีวิตรอดจากศัตรูที่บุกเข้ามาอย่างต่อเนื่อง  
- ศัตรูมีความยากขึ้นเรื่อย ๆ ทั้งจำนวนและความแข็งแกร่ง  
- มีบอสที่ผู้เล่นต้องจัดการเพื่อผ่านด่าน  
- สามารถสะสมคะแนนหรือเวลาการเอาชีวิตรอด  

### Experience  
- ความตื่นเต้นและกดดันเมื่อถูกศัตรูล้อม  
- ความมันส์เมื่อสามารถจัดการศัตรูจำนวนมากได้  
- ความภูมิใจเมื่อผ่านบอสหรือทำสถิติใหม่ได้  
- ความท้าทายที่ทำให้ผู้เล่นอยากกลับมาเล่นซ้ำ  

---

## ประโยชน์ของเกม  
- ฝึกการตัดสินใจและการเคลื่อนไหวอย่างรวดเร็ว  
- พัฒนาทักษะการใช้สายตาและมือ (Hand-Eye Coordination)  
- ฝึกการจัดการทรัพยากร (เลือกเก็บไอเทม/บัฟที่เหมาะสม)  
- สร้างความเพลิดเพลินและคลายเครียด  
- ส่งเสริมการแข่งขันเชิงบวกผ่านการทำคะแนนหรืออยู่รอดให้นานที่สุด  

---

## Screenshots  
<img width="1918" height="1038" alt="image" src="https://github.com/user-attachments/assets/77ba3b1f-9ec6-4c58-8731-c94ad9a005d1" />
<img width="1918" height="1043" alt="image" src="https://github.com/user-attachments/assets/99fb3e15-5c06-4652-ae36-25a43fe3141c" />



---
## ส่วนประกอบตัวละคร
<img width="192" height="160" alt="_male01-spritesheet" src="https://github.com/user-attachments/assets/9674dbb5-9bc3-41c4-a28e-7139be482ebc" /><br>
ผู้เล่น<br>

<img width="224" height="160" alt="boar_spritesheet" src="https://github.com/user-attachments/assets/e3ccc278-70a5-4f60-837c-ca7a743162e6" /><br>
หมูป่า<br>

<img width="288" height="64" alt="vulture_spritesheet" src="https://github.com/user-attachments/assets/3b8be304-d3f2-405e-8207-d1a3838eb50e" /><br>
เหยี่ยว<br>

<img width="32" height="32" alt="DarkGreenDinosaur1" src="https://github.com/user-attachments/assets/5736b17d-f1cd-4459-a733-bf8db6357690" /><br>
ทรราช<br>



---
## Demo  
https://6533801951.github.io/Project-Game-2D/
---

## Credits  
- **Cursor Mouse** : https://spawncampgames.itch.io/white-icon-pack  
- **TileMap** : https://cainos.itch.io/pixel-art-top-down-basic  
- **Player Character** : https://livingtheindie.itch.io/pixel-sidescroller-character  
- **Enemy** : https://tinymuse.itch.io/2d-pixel-woodland-monsters  
- **Boss Enemy** : https://lineacross.itch.io/dino-2d  
- **Item** :  
  - https://idylwild.itch.io/idylwilds-arcanum  
  - https://free-game-assets.itch.io/free-skill-3232-icons-for-cyberpunk-game  
- **UI Buttons** (Start, Exit, Retry) : สร้างเองด้วย https://www.pixilart.com  
- **Music** :  
  - https://pixabay.com  
  - https://mixkit.co  
