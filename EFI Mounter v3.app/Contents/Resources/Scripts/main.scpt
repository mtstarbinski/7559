FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
Created by Koen2X on 2008-12-06
Modified by MacMan on 2015-09-21 to use diskutil and added support for upto 10 volumes.
Use at your own risk. I only made this script for my own person use. 
I am not responsible for anything this may do to your system!

This script assumes that you do not have as existing volume with the name "EFI"

Sometimes Finder does not want to open or close the window. 
I found Finder to be inconsistent when trying to reference the /Volumes/EFI directory.
     � 	 	� 
 C r e a t e d   b y   K o e n 2 X   o n   2 0 0 8 - 1 2 - 0 6 
 M o d i f i e d   b y   M a c M a n   o n   2 0 1 5 - 0 9 - 2 1   t o   u s e   d i s k u t i l   a n d   a d d e d   s u p p o r t   f o r   u p t o   1 0   v o l u m e s . 
 U s e   a t   y o u r   o w n   r i s k .   I   o n l y   m a d e   t h i s   s c r i p t   f o r   m y   o w n   p e r s o n   u s e .   
 I   a m   n o t   r e s p o n s i b l e   f o r   a n y t h i n g   t h i s   m a y   d o   t o   y o u r   s y s t e m ! 
 
 T h i s   s c r i p t   a s s u m e s   t h a t   y o u   d o   n o t   h a v e   a s   e x i s t i n g   v o l u m e   w i t h   t h e   n a m e   " E F I " 
 
 S o m e t i m e s   F i n d e r   d o e s   n o t   w a n t   t o   o p e n   o r   c l o s e   t h e   w i n d o w .   
 I   f o u n d   F i n d e r   t o   b e   i n c o n s i s t e n t   w h e n   t r y i n g   t o   r e f e r e n c e   t h e   / V o l u m e s / E F I   d i r e c t o r y .  
   
  
 l     ��������  ��  ��        j     �� �� 0 	mountname 	mountName  m        �    E F I      j    �� �� 0 
mountpoint 
mountPoint  m       �          j    �� �� 0 currentuser currentUser  m       �          j   	 �� �� 0 partitioninfo partitionInfo  m   	 
   �         !   j    �� "�� 0 dev   " m     # # � $ $ 
 / d e v / !  % & % l     ��������  ��  ��   &  ' ( ' i     ) * ) I     ������
�� .aevtoappnull  �   � ****��  ��   * k     � + +  , - , r     	 . / . I    �� 0 1
�� .sysoexecTEXT���     TEXT 0 m      2 2 � 3 3 ^ d i s k u t i l   i n f o   /   |   a w k   ' / I d e n t i f i e r /   { p r i n t   $ 3 } ' 1 �� 4��
�� 
badm 4 m    ��
�� boovtrue��   / o      ���� 0 currdisk   -  5 6 5 r   
  7 8 7 n  
  9 : 9 1    ��
�� 
txdl : 1   
 ��
�� 
ascr 8 o      ���� 0 x   6  ; < ; r     = > = o    ��
�� 
ret  > n      ? @ ? 1    ��
�� 
txdl @ 1    ��
�� 
ascr <  A B A r    ! C D C c     E F E n     G H G 2    ��
�� 
cwor H l    I���� I I   �� J��
�� .sysoexecTEXT���     TEXT J m     K K � L L j d i s k u t i l   l i s t   |   g r e p   E F I   |   g r e p   - o   - e   d i s k [ 0 - 9 ] s [ 0 - 9 ]��  ��  ��   F m    ��
�� 
list D o      ���� 0 listofdisks listOfDisks B  M N M r   " ' O P O o   " #���� 0 x   P n      Q R Q 1   $ &��
�� 
txdl R 1   # $��
�� 
ascr N  S T S Z   ( g U V�� W U ?  ( / X Y X n   ( - Z [ Z m   + -��
�� 
nmbr [ n  ( + \ ] \ 2  ) +��
�� 
cobj ] o   ( )���� 0 listofdisks listOfDisks Y m   - .����  V k   2 Z ^ ^  _ ` _ I  2 ?�� a b
�� .gtqpchltns    @   @ ns   a o   2 3���� 0 listofdisks listOfDisks b �� c��
�� 
prmp c b   4 ; d e d b   4 7 f g f m   4 5 h h � i i � M u l t i p l e   E F I   p a r t i t i o n s   f o u n d : 
 P l e a s e   s e l e c t   o n e   a n d   c l i c k   O K .   C u r r e n t   B o o t   D i s k   i s   g o   5 6���� 0 currdisk   e m   7 : j j � k k v .   D o   n o t   w o r r y   a b o u t   t h e   s 2   p a r t ,   j u s t   w o r r y   a b o u t   t h e   d i s k��   `  l m l r   @ I n o n l  @ C p���� p 1   @ C��
�� 
rslt��  ��   o l      q���� q o      ���� 0 partitioninfo partitionInfo��  ��   m  r�� r Z  J Z s t���� s =  J Q u v u o   J O���� 0 partitioninfo partitionInfo v m   O P��
�� boovfals t L   T V����  ��  ��  ��  ��   W r   ] g w x w n   ] a y z y 4   ^ a�� {
�� 
cobj { m   _ `����  z o   ] ^���� 0 listofdisks listOfDisks x o      ���� 0 partitioninfo partitionInfo T  | } | r   h u ~  ~ l  h o ����� � I  h o�� ���
�� .sysoexecTEXT���     TEXT � m   h k � � � � �  w h o a m i��  ��  ��    o      ���� 0 currentuser currentUser }  � � � r   v � � � � b   v  � � � m   v y � � � � �  / V o l u m e s / � o   y ~���� 0 	mountname 	mountName � o      ���� 0 
mountpoint 
mountPoint �  � � � I  � ��� � �
�� .sysodlogaskr        TEXT � l  � � ����� � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � � W o u l d   y o u   l i k e   t o   m o u n t   o r   u n m o u n t   t h e   E F I   p a r t i t i o n ? 
 
 E F I   P a r t i t i o n   I d e n t i f i e r :   � o   � ����� 0 partitioninfo partitionInfo � m   � � � � � � �  
 
 M o u n t   p o i n t :   � o   � ����� 0 
mountpoint 
mountPoint��  ��   � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � � 
 M o u n t �  � � � m   � � � � � � �  U n m o u n t �  ��� � m   � � � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   � �����  � �� ���
�� 
disp � m   � ���
�� stic   ��   �  ��� � Z   � � � � � � � =  � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
bhit � l  � � ����� � 1   � ���
�� 
rslt��  ��  ��  ��   � m   � � � � � � � 
 M o u n t � I   � ��������� 0 mountefi mountEFI��  ��   �  � � � =  � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
bhit � l  � � ����� � 1   � ���
�� 
rslt��  ��  ��  ��   � m   � � � � � � �  U n m o u n t �  ��� � I   � ��������� 0 
unmountefi 
unmountEFI��  ��  ��   � L   � � � � m   � �����  ��   (  � � � l     ��������  ��  ��   �  � � � i     � � � I      �������� 0 mountefi mountEFI��  ��   � k     � � �  � � � l     �� � ���   � Y SThis is just to make sure there was not a problem getting the partition identifier.    � � � � � T h i s   i s   j u s t   t o   m a k e   s u r e   t h e r e   w a s   n o t   a   p r o b l e m   g e t t i n g   t h e   p a r t i t i o n   i d e n t i f i e r . �  � � � Z     I � ����� � H      � � E     � � � J      � �  � � � m      � � � � �  d i s k 0 s 1 �  � � � m     � � � � �  d i s k 1 s 1 �  � � � m     � � � � �  d i s k 2 s 1 �  � � � m     � � � � �  d i s k 3 s 1 �  � � � m     � � � � �  d i s k 4 s 1 �  � � � m     � � � � �  d i s k 5 s 1 �  � � � m     � � � � �  d i s k 6 s 1 �  � � � m     � � � � �  d i s k 7 s 1 �  � � � m    	 � � � � �  d i s k 8 s 1 �  ��� � m   	 
 � � � � �  d i s k 9 s 1��   � o    ���� 0 partitioninfo partitionInfo � k    E    I   0��
�� .sysodlogaskr        TEXT l   ���� b     m     �		 8 U n e x p e c t e d   d i s k   i d e n t i f i e r :   o    ���� 0 partitioninfo partitionInfo��  ��   ��

�� 
btns
 J    "  m     �  C o n t i n u e �� m      �  S t o p��   ��
�� 
dflt m   # $����  ����
�� 
disp m   ' *��
�� stic   ��   �� Z  1 E���� =  1 < l  1 8��~ n   1 8 1   4 8�}
�} 
bhit l  1 4�|�{ 1   1 4�z
�z 
rslt�|  �{  �  �~   m   8 ;   �!!  S t o p L   ? A"" m   ? @�y�y  ��  ��  ��  ��  ��   � #$# l  J J�x�w�v�x  �w  �v  $ %&% Q   J m'(�u' I  M d�t)*
�t .sysoexecTEXT���     TEXT) l  M \+�s�r+ b   M \,-, b   M V./. m   M P00 �11  d i s k u t i l   m o u n t  / o   P U�q�q 0 dev  - o   V [�p�p 0 partitioninfo partitionInfo�s  �r  * �o2�n
�o 
badm2 m   _ `�m
�m boovtrue�n  ( R      �l�k�j
�l .ascrerr ****      � ****�k  �j  �u  & 343 l  n n�i�h�g�i  �h  �g  4 5�f5 O   n �676 k   t �88 9:9 I  t y�e�d�c
�e .miscactvnull��� ��� obj �d  �c  : ;�b; I  z ��a�`<
�a .corecrel****      � null�`  < �_=>
�_ 
kocl= m   ~ ��^
�^ 
brow> �]?�\
�] 
to  ? c   � �@A@ l  � �B�[�ZB e   � �CC o   � ��Y�Y 0 
mountpoint 
mountPoint�[  �Z  A m   � ��X
�X 
psxf�\  �b  7 m   n qDD�                                                                                  MACS  alis    V  HD                         ��O�H+   	�
Finder.app                                                      ����        ����  	                CoreServices    ���K      ��vn     	� 	� 	�  ,HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    H D  &System/Library/CoreServices/Finder.app  / ��  �f   � EFE l     �W�V�U�W  �V  �U  F GHG i    IJI I      �T�S�R�T 0 
unmountefi 
unmountEFI�S  �R  J k     �KK LML Z     NO�Q�PN =    PQP I     �O�N�M�O 0 mountstatus mountStatus�N  �M  Q m    RR �SS  N o t   M o u n t e dO k   
 TT UVU I  
 �LWX
�L .sysodlogaskr        TEXTW m   
 YY �ZZ \ T h e   E F I   p a r t i t i o n   d o e s   n o t   s e e m   t o   b e   m o u n t e d .X �K[\
�K 
btns[ J    ]] ^�J^ m    __ �``  C a n c e l�J  \ �Iab
�I 
dflta m    �H�H b �Gc�F
�G 
dispc m    �E
�E stic   �F  V d�Dd L    ee m    �C�C  �D  �Q  �P  M fgf l   �B�A�@�B  �A  �@  g h�?h Q    �ijki I  " 5�>lm
�> .sysoexecTEXT���     TEXTl l  " /n�=�<n b   " /opo b   " )qrq m   " #ss �tt " d i s k u t i l   u n m o u n t  r o   # (�;�; 0 dev  p o   ) .�:�: 0 partitioninfo partitionInfo�=  �<  m �9u�8
�9 
badmu m   0 1�7
�7 boovtrue�8  j R      �6�5�4
�6 .ascrerr ****      � ****�5  �4  k k   = �vv wxw I  = O�3yz
�3 .sysodlogaskr        TEXTy m   = >{{ �|| B U n a b l e   t o   u n m o u n t .   F o r c e   u n m o u n t ?z �2}~
�2 
btns} J   ? G ��� m   ? B�� ��� 
 F o r c e� ��1� m   B E�� ���  C a n c e l�1  ~ �0��/
�0 
dflt� m   H I�.�. �/  x ��-� Z   P ����,�� =  P [��� l  P W��+�*� n   P W��� 1   S W�)
�) 
bhit� l  P S��(�'� 1   P S�&
�& 
rslt�(  �'  �+  �*  � m   W Z�� ���  C a n c e l� k   ^ l�� ��� I  ^ i�%��
�% .sysodlogaskr        TEXT� m   ^ a�� ��� n P l e a s e   m a n u a l l y   u n m o u n t   t h e   p a r t i t i o n   b e f o r e   r e b o o t i n g .� �$��#
�$ 
disp� m   b e�"
�" stic    �#  � ��!� L   j l�� m   j k� �   �!  �,  � Q   o ����� I  r ����
� .sysoexecTEXT���     TEXT� l  r {���� b   r {��� m   r u�� ���  u m o u n t   - f  � o   u z�� 0 
mountpoint 
mountPoint�  �  � ���
� 
badm� m   | }�
� boovtrue�  � R      ���
� .ascrerr ****      � ****� l     ���� o      �� 0 error_message  �  �  � ���
� 
errn� l     ���� o      �� 0 error_number  �  �  �  � k   � ��� ��� I  � ����
� .sysodlogaskr        TEXT� b   � ���� b   � ���� b   � ���� m   � ��� ��� ^ U n a b l e   t o   u n m o u n t   t h e   E F I   p a r t i t i o n ! 
 	 	 	 E r r o r :  � l  � ����� o   � ��� 0 error_number  �  �  � m   � ��� ���  .  � l  � ����
� o   � ��	�	 0 error_message  �  �
  � ���
� 
btns� J   � ��� ��� m   � ��� ���  C a n c e l�  � ���
� 
dflt� m   � ��� � ���
� 
disp� m   � ��
� stic    �  � ��� L   � ��� m   � �� �   �  �-  �?  H ��� l     ��������  ��  ��  � ��� i    ��� I      �������� 0 mountstatus mountStatus��  ��  � Q     8���� Z    .����� H    �� E    ��� l   ������ I   �����
�� .sysoexecTEXT���     TEXT� l   ������ m    �� ���  l s   / V o l u m e s /��  ��  ��  ��  ��  � o    ���� 0 	mountname 	mountName� L    �� m    �� ���  N o t   M o u n t e d� ��� =   $��� l   "������ I   "�����
�� .sysoexecTEXT���     TEXT� l   ������ b    ��� m    �� ���  l s  � o    ���� 0 
mountpoint 
mountPoint��  ��  ��  ��  ��  � m   " #�� ���  � ���� L   ' )�� m   ' (�� ��� 
 E m p t y��  � L   , .�� m   , -�� ���  M o u n t e d� R      ������
�� .ascrerr ****      � ****��  ��  � L   6 8�� m   6 7�� ��� 
 E r r o r� ���� l     ��������  ��  ��  ��       ��� ��� #�� ��������������  � �������������������������������������� 0 	mountname 	mountName�� 0 
mountpoint 
mountPoint�� 0 currentuser currentUser�� 0 partitioninfo partitionInfo�� 0 dev  
�� .aevtoappnull  �   � ****�� 0 mountefi mountEFI�� 0 
unmountefi 
unmountEFI�� 0 mountstatus mountStatus�� 0 currdisk  �� 0 x  �� 0 listofdisks listOfDisks��  ��  ��  ��  ��  ��  � �  / V o l u m e s / E F I� � 
 s c o t t� ����    �		  d i s k 0 s 1� �� *����
��
�� .aevtoappnull  �   � ****��  ��  
   % 2�������������� K������������ h j���� � � � ��� � � ������������� ��� ���
�� 
badm
�� .sysoexecTEXT���     TEXT�� 0 currdisk  
�� 
ascr
�� 
txdl�� 0 x  
�� 
ret 
�� 
cwor
�� 
list�� 0 listofdisks listOfDisks
�� 
cobj
�� 
nmbr
�� 
prmp
�� .gtqpchltns    @   @ ns  
�� 
rslt
�� 
btns
�� 
dflt
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT
�� 
bhit�� 0 mountefi mountEFI�� 0 
unmountefi 
unmountEFI�� ���el E�O��,E�O���,FO�j �-�&E�O���,FO��-�,k -����%a %l O_ Ec  Ob  f  hY hY ��k/Ec  Oa j Ec  Oa b   %Ec  Oa b  %a %b  %a a a a mva ma a a  O_ a  ,a !  
*j+ "Y _ a  ,a #  
*j+ $Y j� �� ��������� 0 mountefi mountEFI��  ��     $ � � � � � � � � � ������������������� 0��������D���������������� 

�� 
btns
�� 
dflt
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� 
badm
�� .sysoexecTEXT���     TEXT��  ��  
�� .miscactvnull��� ��� obj 
�� 
kocl
�� 
brow
�� 
to  
�� 
psxf�� 
�� .corecrel****      � null�� ������������vb   4�b  %���lv�la a a  O_ a ,a   jY hY hO a b  %b  %a el W X  hOa  !*j O*a a a  b  a !&a " #U  ��J�������� 0 
unmountefi 
unmountEFI��  ��   ������ 0 error_message  �� 0 error_number   ��RY��_����������s��������{�������������������� 0 mountstatus mountStatus
�� 
btns
�� 
dflt
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT
�� 
badm
�� .sysoexecTEXT���     TEXT��  ��  �� 
�� 
rslt
�� 
bhit
�� stic    �� 0 error_message   ��~�}
� 
errn�~ 0 error_number  �}  �� �*j+  �  ���kv�k��� 	OjY hO �b  %b  %�el W qX  ��a a lv�la  	O_ a ,a   a �a l 	OjY : a b  %�el W %X  a �%a %�%�a kv�k�a � 	Oj �|��{�z�y�| 0 mountstatus mountStatus�{  �z     
��x������w�v�
�x .sysoexecTEXT���     TEXT�w  �v  �y 9 0�j b    �Y �b  %j �  �Y �W 	X  � �  d i s k 0 s 2 �u�u    �   �t�t   �s�r�q�p�o�n�m�l�k�j�i�h�g�f �  d i s k 0 s 1 �  d i s k 1 s 2�s  �r  �q  �p  �o  �n  �m  �l  �k  �j  �i  �h  �g  �f  ��  ��  ��  ��  ��  ��   ascr  ��ޭ