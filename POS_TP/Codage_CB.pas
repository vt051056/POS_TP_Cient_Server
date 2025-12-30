(*******************************************************************************

Auteur : Francisco FERNANDEZ (ffrancisco@free.fr).
Version : 1.0 du 07/03/2006 (jour de lutte contre le CPE en France !!!)
Licence : BSD-Love, vous étes autorisés à faire ce que vous voulez avec ces sources,
vous avez aussi le droit de dire un merci amical aux auteurs, mais ce n'est absolument pas
obligatoire, la condition 3 de la licence vous oblige seulement à signaler
l'origine open-source de ce code, car ça ça me parait important !

			---- La texte de la licence BSD-Love ----

Copyright 2006 FERNANDEZ Francisco.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice,
      this list of conditions and the following disclaimer.
   2. Redistributions in binary form must reproduce the above copyright notice,
      this list of conditions and the following disclaimer in the documentation
      and/or other materials provided with the distribution.
   3. All advertising materials mentioning features or use of this software must
      display the following acknowledgement:

	  This product includes software originaly distrubuted under the BSD-Love license.

   4. Neither the names of its contributors may be used to endorse or promote
      products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE CONTRIBUTORS ``AS IS'' AND ANY EXPRESS
OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

			-----------------------------------------


Les fonctions GZCode39, GZCode128, GZCodeEAN13 et GZCode25 permet de coder une
chaine de caractères en une chaine directement imprimable avec, respectivement,
les polices code39.ttf, code128.ttf, ean13.ttf et code25I.ttf de http://grandzebu.net
pour produire les jolis codes à barres attendus.

Les procédures DessinCode39, DessinCode128, DessinCodeEAN13 et DessinCode25 sont
plus facilement utilisables sous Delphi ou Lazarus car elles n'ont besoin de
rien d'autre que le code présent dans cette unité et les fonctions de tracé de
rectangles du language utilisé.

Tout ce ci n'est absolument pas granti par l'auteur.
Si ça ne marche pas, faites-le moi savoir (ffrancisco@free.fr),
ou débrouillez-vous avec ces sources.

*******************************************************************************)

UNIT Codage_CB;

				INTERFACE

USES Windows, Graphics, SysUtils; // Uniquement pour les fonctions DessineCodeXXX


TYPE

TCodeCB = (cbCode39, cbCode128, cbCodeEAN13, cbCode25);
TCBDirection = (cbdDroite, cbdHaut, cbdGauche, cbdBas); // Directions de dessin


(* Fonctions de conversion en chaines imprimables avec les polices de GrandZebu,
   il vous faut télécharger ces polices sur le site http://grandzebu.net et les
   copier dans votre dossier Windows\Fonts *)

FUNCTION GZCode39(S : String; CheckSum : Boolean) : String;
{ Fonction convertissant la chaine S en une chaine Code39 pouvant être renvoyant
  imprimée avec la police CODE39.ttf de GrandZebu }

FUNCTION GZCode128(S : String) : String;
{ Fonction convertissant la chaine S en une chaine Code128 pouvant être
  imprimée avec la police CODE128.ttf de GrandZebu }

FUNCTION GZCodeEAN13(Const S : String): String;
{ Fonction convertissant la chaine S en une chaine CodeEAN13 pouvant être renvoyant
  imprimée avec la police ean13.ttf de GrandZebu }

FUNCTION GZCode25(S : String; CheckSum : Boolean) : String;
{ Fonction convertissant la chaine S en une chaine Code25 pouvant être renvoyant
  imprimée avec la police CODE25I.ttf de GrandZebu }


(* Fonctions dessinant directement les codes à barres dans un canvas, sans besoin
   de polices supplémentaires.
   Utilisation des paramèters :
   S : Chaine à dessiner, contenant seulement des caractères acceptables par le code désiré
   Dir : Direction de dessin du code à barres
   X, Y : Position d'origine du dessin, renvoient la position finale
   H : Hauteur des barres (sera aussi multiplié par Mul)
   Mul : Multiplicateur d'échelle, nombre de points de largeur d'une barre élémentaire *)

PROCEDURE DessinCode39(S : String; CA : TCanvas; Dir : TCBDirection;
		X, Y, H, Mul : Integer; CheckSum : Boolean);
{ Trace le code à barres (Code39) de la chaine S.
  Le caractère somme de contrçole sera ajouté si CheckSum le demande }

PROCEDURE DessinCode128(S : String; CA : TCanvas; Dir : TCBDirection;
		X, Y, H, Mul : Integer);
{ Trace le code à barres (Code128) de la chaine S }

PROCEDURE DessinCodeEAN13(S : String; CA : TCanvas; Dir : TCBDirection;
		X, Y, H, Mul : Integer; Clair : Boolean = True);
{ Trace le code à barres (CodeEAN13) de la chaine S }

PROCEDURE DessinCode25(S : String; CA : TCanvas; Dir : TCBDirection;
		X, Y, H, Mul : Integer);
{ Trace le code à barres (Code 2 de 5) de la chaine S
  Puisque le nombre de caractères représentés par un Code 2 de 5 doit être pair,
  si la longuer de S est impaire, la somme de contrôle sera ajoutée à la fin,
  elle ne sera pas ajoutée si la longueur est paire }

  function calc_CodeEAN13(s:string): string;

				IMPLEMENTATION



FUNCTION GZCode39(S : String; CheckSum : Boolean) : String;
{ Fonction convertissant la chaine S en une chaine Code39 pouvant être
  imprimée avec la police CODE39.ttf de GrandZebu }
Type
T2C = Packed Array[1..2] Of Char;
Var
I,L,M	: Integer;
C,P	: Char;
Const
TCC	: Array[#0..#127] Of T2C =
 ('%U', '$A', '$B', '$C', '$D', '$E', '$F', '$G', '$H', '$I',
  '$J', '$K', '$L', '$M', '$N', '$O', '$P', '$Q', '$R', '$S',
  '$T', '$U', '$V', '$W', '$X', '$Y', '$Z', '%A', '%B', '%C',
  '%D', '%E', '  ', '/A', '/B', '/C', '/D', '/E', '/F', '/G',
  '/H', '/I', '/J', '/K', '/L', ' -', ' .', '/O', ' 0', ' 1',
  ' 2', ' 3', ' 4', ' 5', ' 6', ' 7', ' 8', ' 9', '/Z', '%F',
  '%G', '%H', '%I', '%J', '%V', ' A', ' B', ' C', ' D', ' E',
  ' F', ' G', ' H', ' I', ' J', ' K', ' L', ' M', ' N', ' O',
  ' P', ' Q', ' R', ' S', ' T', ' U', ' V', ' W', ' X', ' Y',
  ' Z', '%K', '%L', '%M', '%N', '%O', '%W', '+A', '+B', '+C',
  '+D', '+E', '+F', '+G', '+H', '+I', '+J', '+K', '+L', '+M',
  '+N', '+O', '+P', '+Q', '+R', '+S', '+T', '+U', '+V', '+W',
  '+X', '+Y', '+Z', '%P', '%Q', '%R', '%S', '%T');
BEGIN
Result := '';
If S = '' Then Exit;
L := Length(S);
// Premier passage pour vérifier que tous les caractères de S sont < #128
// et pour déterminer la longueur de la chaine résultat
For I := 1 To L Do
 begin
  If S[I] > #127 Then Exit;
  If TCC[S[I], 1] <> ' ' Then Inc(L);
 end;
Inc(L, 2);
If CheckSum Then Inc(L);
SetLength(Result, L); // Création du résultat avec la bonne longueur
Result[1] := '*'; // Marqueurs de début et fin
Result[L] := '*';
// Deuxième passage pour enregistrer les caractères du résultat
L := 2;
For I := 1 To Length(S) Do
 begin
  C := S[I];
  P := TCC[C, 1];
  If P <> ' '
  Then
   begin
    Result[L] := P;
    Inc(L);
    C := TCC[C, 2];
   end;
  Result[L] := C;
  Inc(L);
 end;
// Enregistrement de la somme de contrôle si demandé
If CheckSum
Then
 begin
  M := 0;
  For I := 2 To Pred(L) Do
   begin
    C := Result[I];
    Case C Of
      '0'..'9' : Inc(M, Ord(C) - 48);
      'A'..'Z' : Inc(M, Ord(C) - 55);
      '-' : Inc(M, 36);
      '.' : Inc(M, 37);
      ' ' : Inc(M, 38);
      '$' : Inc(M, 39);
      '/' : Inc(M, 40);
      '+' : Inc(M, 41);
      '%' : Inc(M, 42);
    End;
   end;
  M := M Mod 43;
  Case M Of
    0..9 : C := Chr(M + 48);
    10..35 : C := Chr(M + 55);
    36 : C := '-';
    37 : C := '.';
    38 : C := ' ';
    39 : C := '$';
    40 : C := '/';
    41 : C := '+';
    42 : C := '%';
  End;
  Result[L] := C;
 end;
END;

FUNCTION GZCodeEAN13(Const S : String): String;
{ Fonction convertissant la chaine S en une chaine CodeEAN13 pouvant être
  imprimée avec la police ean13.ttf de GrandZebu }
Type
TBPos = (B2, B3, B4, B5, B6, B7); // Les caractères utilisant la table B, les autres utilisant la table A
TSBPos = Set Of TBPos;
Var
I	: integer;
IB	: TBPos;
b:byte;
Const
TAB : Array['0'..'9'] Of TSBPos = // Table d'utilisation des tables A ou B en fonction du premièr caractère
{0}  ([],
{1}   [B4, B6, B7],
{2}   [B4, B5, B7],
{3}   [B4, B5, B6],
{4}   [B3, B6, B7],
{5}   [B3, B4, B7],
{6}   [B3, B4, B5],
{7}   [B3, B5, B6],
{8}   [B3, B4, B7],
{9}   [B3, B4, B6]);
BEGIN
Result := ''; // Résultat vide si erreur
If Length(S) <> 12 Then Exit; // La chaine d'entrée doit avoir 12 caractères
For I := 1 To 12 Do // Tous les caractères doivent être des chiffres
  If (S[I] < '0') Or (S[I] > '9') Then Exit;
// Initialisation de la chaine avec la bonne longueur
SetLength(Result, 15);
// Calcul (et enregistrement à sa place dans Result) de la somme de contrôle
I := 3 * (Ord(S[2]) + Ord(S[4]) + Ord(S[6]) + Ord(S[8]) + Ord(S[10]) + Ord(S[12]) - 48 * 6) +
     Ord(S[1]) + Ord(S[3]) + Ord(S[5]) + Ord(S[7]) + Ord(S[9]) + Ord(S[11]) - 48 * 6;
Result[14] := Chr((10 - (I Mod 10)) Mod 10 + 97);
// Séparateurs de début, du milieu et de fin
Result[1] := S[1];
Result[8] := '*';
Result[15]:= '+';
// Transcodage des 6 premièrs caractères (2 à 7)
{ Patois incompréhensible !!! mais n'incrémentant que l'indice de boucle
For IB := B2 To B7 Do
  Result[Ord(IB) + 2] := Chr(Ord(S[Ord(IB) + 2]) - 48 + 65 + 10 * Ord(IB In TAB[S[1]]));
}
{ La même chose en plus digeste mais utilisant plus de variables et de code }
I := 2;
For IB := B2 To B7 Do
 begin
  Result[I] := Chr(Ord(S[I]) - 48 + 65);
  If IB In TAB[S[1]] Then
   begin
    b:=Byte(Result[I]);
    Inc(b, 10);
    Result[I]:=Char(b);
   end;
  Inc(I);
 end;
{}
// Transcodage des 5 derniers caractères (8 à 12)
For I := 9 To 13 Do
  Result[I] := Chr(Ord(S[I - 1]) - 48 + 97);
END;


FUNCTION GZCode25(S : String; CheckSum : Boolean) : String;
{ Fonction convertissant la chaine S en une chaine Code25I pouvant être
  imprimée avec la police CODE25I.ttf de GrandZebu }
Var
I,R,E	: Integer;
BEGIN
Result := '';
If S = '' Then Exit;
If Odd(Length(S)) Xor CheckSum Then Exit; // Nombre pair et pas de somme de contrôle ou impair + somme de contrôle
E := 0;
R := 0;
For I := 1 To Length(S) Do
 begin
  If Not (S[I] In ['0'..'9']) Then Exit;
  If Odd(I)
  Then Inc(R, Ord(S[I]) - 48)
  Else Inc(E, Ord(S[I]) - 48);
 end;
I := (Length(S) Shr 1) + 2; // Longueur résultat = nombre de paires plus marques de début et fin
If CheckSum
Then
 begin
  Inc(I); // Une paire de plus dans le résultat
  Inc(E, R * 3);
  E := (10 - (E Mod 10)) Mod 10 + (Ord(S[Length(S)]) - 48) * 10;
 end;
SetLength(Result, I);
If CheckSum
Then
 begin
  If E > 93
  Then Inc(E, 101)
  Else Inc(E, 33);
  Result[Pred(I)] := Chr(E);
 end;
Result[1] := #201; // Marque de début
Result[I] := #202; // Marque de fin
R := 2;
I := 1;
While I < Length(S) Do
 begin
  E := (Ord(S[I]) - 48) * 10 + Ord(S[I + 1]) - 48;
  If E > 93
  Then Inc(E, 101)
  Else Inc(E, 33);
  Result[R] := Chr(E);
  Inc(R);
  Inc(I, 2);
 end;
END;

FUNCTION GZCode128(S : String) : String;
{ Fonction convertissant la chaine S en une chaine Code128 pouvant être
  imprimée avec la police CODE128.ttf de GrandZebu }
Var
I,V,L,R,M : Integer;
TableB	: Boolean;

Function TestNum(N : Integer) : Boolean;
Begin
// Renvoi True si les N caractères à partir de I sont numériques
// Return if the N characters from I are numeric
Result := False;
Dec(N);
If (I + N) > Length(S) Then Exit;
For N := I To I + N Do
  If Not (S[N] In ['0'..'9']) Then Exit;
Result := True;
End;

BEGIN
Result := '';
If S = '' Then Exit;
L := Length(S);
For I := 1 To L Do
  If Not (S[I] In [#32..#126, #198]) Then Exit;

// Premier passage pour déterminer la longueur du résultat
R := 3;	// La longueur du résultat est déjà de 2 caractères,
	// 1 pour indiquer la table de début,
	// 1 pour la somme de contrôle
	// l'autre pour la marque de fin #211
TableB := True;
I := 1;
While I <= L Do
 begin
  If TableB
  Then
   begin
    If (I = 1) Or (I = (L - 3))
    Then V := 4
    Else V := 6;
    If TestNum(V)
    Then
     begin
      If I > 1 Then Inc(R); // 1 caractère pour commuter en table C / 1 char to Switch to table C
      TableB := False;
     end;
   end;
  If Not TableB
  Then
   begin
// On est sur la table C, essayer de traiter 2 chiffres / We are on table C, try to process 2 digits
    If TestNum(2)
    Then Inc(I, 2) // OK pour 2 chiffres, les traiter / OK for 2 digits, process it
    Else TableB := True; // On n'a pas 2 chiffres, repasser en table B / We haven't 2 digits, switch to table B
    Inc(R);
   end;
  If TableB
  Then
   begin
// Traiter 1 caractère en table B / Process 1 digit with table B
    Inc(R);
    Inc(I);
   end;
 end;

SetLength(Result, R); // Initialisation de la chaine résultat à sa longueur définitive

R := 1; // Indice d'enregistrement du caractère en cours du résultat
TableB := True;
I := 1;
While I <= Length(S) Do
 begin
  If TableB
  Then
   begin
    If (I = 1) Or (I = (Length(S) - 3))
    Then V := 4
    Else V := 6;
    If TestNum(V)
    Then
     begin
      If I = 1
      Then Result[1] := #210 // Débuter sur table C / Starting with table C
      Else Result[R] := #204; // Commuter sur table C / Switch to table C
      Inc(R);
      TableB := False;
     end
    Else
      If I = 1
      Then
       begin
	Result[1] := #209; // Débuter sur table B / Starting with table B
	Inc(R);
       end;
   end;
  If Not TableB
  Then
   begin
// On est sur la table C, essayer de traiter 2 chiffres / We are on table C, try to process 2 digits
    If TestNum(2)
    Then // OK pour 2 chiffres, les traiter / OK for 2 digits, process it
     begin
      V := (Ord(S[I]) - 48) * 10 + Ord(S[I + 1]) - 48;
      If V < 95 Then Inc(V, 32) Else Inc(V, 100);
      Result[R] := Chr(V);
      Inc(R);
      Inc(I, 2);
     end
    Else // On n'a pas 2 chiffres, repasser en table B / We haven't 2 digits, switch to table B
     begin
      Result[R] := #205;
      Inc(R);
      TableB := True
     end;
   end;
  If TableB
  Then
   begin
// Traiter 1 caractère en table B / Process 1 digit with table B
    Result[R] := S[I];
    Inc(R);
    Inc(I);
   end;
 end;

//Calcul de la clé de contrôle / Calculation of the checksum
For I := 1 To Pred(R) Do
 begin
  V := Ord(Result[I]);
  If V > 126 Then Dec(V, 100) Else Dec(V, 32);
  If I = 1 Then M := V;
  M := (M + Pred(I) * V) Mod 103;
 end;
// Calcul du code ASCII de la clé / Calculation of the checksum ASCII code
If M < 95 Then Inc(M, 32) Else Inc(M, 100);
// Ajout de la clé et du STOP / Add the checksum and the STOP
Result[R] := Chr(M);
Result[R + 1] :=  #211;
END;
(*
FUNCTION GZCode128(S : String) : String;
{ Fonction convertissant la chaine S en une chaine Code128 pouvant être renvoyant
  imprimée avec la police CODE128.ttf de GrandZebu.
  Cette fonction ne fait pas le premièr passage pour déterminer la longueur du résultat,
  elle allonge la chaine résultat en ajoutant les caractères un par un.
  Cette méthode semble plus simple que celle utilisée dans la fonction précédente
  car elle n'a pas besoin de faire un premier passage pour déterminer la longueur du résultat.
  Je déconseille cette méthode (et je l'évite autant que faire se peut) en raison de
  la réservation d'une nouvelle plage mémoire et la copie de la chaine vers ce nouvel
  emplacement qu'entraine chaque allongement de la chaine.
  Dans cet exemple, le traitement de chaines de Delphi (ou tout autre language utilisant
  des chaines dynamiques) induit par la répétition des lignes Result := Result + Chr(V);
  représenterait certainement plus de temps machine que tout le reste de la fonction GZCode128 }
Var
I,V,R,M	: Integer;
TableB	: Boolean;

Function TestNum(N : Integer) : Boolean;
Begin
// Renvoi True si les N caractères à partir de I sont numériques
// Return if the N characters from I are numeric
Result := False;
Dec(N);
If (I + N) > Length(S) Then Exit;
For N := I To I + N Do
  If Not (S[N] In ['0'..'9']) Then Exit;
Result := True;
End;

BEGIN
Result := '';
If S = '' Then Exit;
For I := 1 To Length(S) Do
  If Not (S[I] In [#32..#126, #198]) Then Exit;
R := 1;
TableB := True;
I := 1;
While I <= Length(S) Do
 begin
  If TableB
  Then
   begin
    If (I = 1) Or (I = (Length(S) - 3))
    Then M := 4
    Else M := 6;
    If TestNum(M)
    Then
      If I = 1
      Then Result := #210 // Débuter sur table C / Starting with table C
      Else Result := Result + #204 // Commuter sur table C / Switch to table C
    Else
      If I = 1 Then Result := #209; // Débuter sur table B / Starting with table B
   end;
  If Not TableB
  Then
   begin
// On est sur la table C, essayer de traiter 2 chiffres / We are on table C, try to process 2 digits
    If TestNul(2)
    Then // OK pour 2 chiffres, les traiter / OK for 2 digits, process it
     begin
      V := (Ord(S[I]) - 48) * 10 + Ord(S[I + 1]) - 48;
      If V < 95 Then Inc(V, 32) Else Inc(V, 100);
      Result := Result + Chr(V);
      Inc(I, 2);
     end
    Else // On n'a pas 2 chiffres, repasser en table B / We haven't 2 digits, switch to table B
     begin
      Result := Result + #205;
      TableB := True
     end;
   end;
  If TableB
  Then
   begin
// Traiter 1 caractère en table B / Process 1 digit with table B
    Result := Result + S[I];
    Inc(I);
   end;
 end;

//Calcul de la clé de contrôle / Calculation of the checksum
For I := 1 To Len(Result) Do
 begin
  V := Ord(Result[I]);
  If V < 127 Then Dec(V, 32) Else Dec(V, 100);
  If I = 1 Then M := V;
  M := (M + Pred(I) * V) Mod 103;
 end;
// Calcul du code ASCII de la clé / Calculation of the checksum ASCII code
If M < 95 Then Inc(M, 32) Else Inc(M, 100);
// Ajout de la clé et du STOP / Add the checksum and the STOP
Result := Result + Chr(M) + #211;
END;
*)

	(* Dessin des codes à barres en traçant des traits sur un canvas *)

PROCEDURE DessineBloc(Data : Integer; CA : TCanvas; Dir : TCBDirection; Var X, Y : Integer; H, Mul, Nb : Integer);
{ Fonction générale utilisée par les autres fonctions de dessin de codes à barres
  pour dessiner un caractère ou un marqueur.
  Trace le groupe de barres défini par les bits de Data.
  1 bit à 0 indique un espace, 1 bit à un indique une barre.
  Une barre large est signalée par plusieurs bits successifs de même valeur.
  Le bit de poids faible de Data correspond à la barre de gauche. }
Var
I,N,
XX,YY	: Integer;
B1	: Boolean;
Rec	: TRect;
BEGIN
XX := X;
YY := Y;
B1 := Odd(Data);
I := 0;
While I < Nb Do
 begin
// Déterminer le nombre de bits (largeur élémentaire de barre) égaux successifs
  N := I;
  Repeat
    Inc(I);
    Data := Data Shr 1;
  Until (I >= Nb) Or (B1 <> (Odd(Data)));
  N := I - N;
  B1 := Not B1;
  With Rec Do // Détermine le rectangle représentant la barre à dessiner
   begin
    Case Dir Of
      cbdDroite : // De XX vers la droite et sous YY
       begin
	Left := XX;
	Inc(XX, N * Mul);
	Right := XX;
	Top := YY;
	Bottom := YY + H * Mul;
       end;
      cbdHaut : // De YY vers le haut et à gauche de XX
       begin
	Left := XX;
	Right := XX + H * Mul;
	Bottom := Succ(YY);
	Dec(YY, N * Mul);
	Top := Succ(YY);
       end;
      cbdGauche : // De XX vers la gauche et au dessus de YY
       begin
	Right := Succ(XX);
	Dec(XX, N * Mul);
	Left := Succ(XX);
	Bottom := Succ(YY);
	Top := YY - Pred(H * Mul);
       end;
      cbdBas : // De YY vers le bas et à droite de XX
       begin
	Left := XX - H * Mul;
	Right := XX;
	Top := YY;
	Inc(YY, N * Mul);
	Bottom := YY;
       end;
    End;
    If Not B1 // Ne dessine que les barres noires
    Then CA.FillRect(Rec);
   end;
 end;
X := XX; // Renvoi les positions courantes
Y := YY;
END;

PROCEDURE DessineCaractere(Const Data; CA : TCanvas; Dir : TCBDirection; X, Y, H, Mul, NC, NL : Integer);
{ Dessine un caractère défini par le bitmap Data, de NL lignes de NC points.
  Chaque ligne de Data est codée sur 1, 2 ou 4 octets.
  Le bit de poids faible de Data correspond au point de gauche de la ligne. }
Var
M,NB,
I,J,N,
XX,YY	: Integer;
P	: Pointer;
B1	: Boolean;
Rec	: TRect;
BEGIN
NB := 8; // Détermine le nombre d'octets par ligne
While Nb < NC Do Inc(NB, NB);
NB := NB Shr 3;

// Détermine la vrai position du caractère en considérant que X et Y sont
// Les coordonnées
H := (H + 1) * Mul;
Case Dir Of
  cbdDroite :
   begin
    Inc(X, Mul);
    Inc(Y, H);
   end;
  cbdHaut :
   begin
    Dec(Y, Mul);
    Inc(X, H);
   end;
  cbdGauche :
   begin
    Dec(X, Mul);
    Dec(Y, H);
   end;
  cbdBas :
   begin
    Inc(Y, Mul);
    Dec(X, H);
   end;
End;

P := @Data;
For J := 1 To NL Do
 begin
  Case NB Of
    1 :
     begin
      M := Byte(P^);
      Inc(Integer(P));
     end;
    2 :
     begin
      M := Word(P^);
      Inc(Integer(P), 2);
     end;
    4 :
     begin
      M := Integer(P^);
      Inc(Integer(P), 4);
     end;
  End;
  XX := X;
  YY := Y;
  B1 := Odd(M);
  I := 0;
  While I < NC Do
   begin
  // Déterminer le nombre de bits (largeur élémentaire de barre) égaux successifs
    N := I;
    Repeat
      Inc(I);
      M := M Shr 1;
    Until (I >= NC) Or (B1 <> (Odd(M)));
    N := I - N;
    B1 := Not B1;
    With Rec Do // Détermine le rectangle à dessiner
     begin
      Case Dir Of
	cbdDroite : // De XX vers la droite et sous YY
	 begin
	  Left := XX;
	  Inc(XX, N * Mul);
	  Right := XX;
	  Top := YY;
	  Bottom := YY + Mul;
	 end;
	cbdHaut : // De YY vers le haut et à gauche de XX
	 begin
	  Left := XX;
	  Right:= XX + Mul;
	  Bottom := Succ(YY);
	  Dec(YY, N * Mul);
	  Top := Succ(YY);
	 end;
	cbdGauche : // De XX vers la gauche et au dessus de YY
	 begin
	  Right := Succ(XX);
	  Dec(XX, N * Mul);
	  Left := Succ(XX);
	  Bottom := Succ(YY);
	  Top := YY - Pred(Mul);
	 end;
	cbdBas : // De YY vers le bas et à droite de XX
	 begin
	  Left := XX - Mul;
	  Right:= XX;
	  Top := YY;
	  Inc(YY, N * Mul);
	  Bottom := YY;
	 end;
      End;
      If Not B1 // Ne dessine que les barres noires
      Then CA.FillRect(Rec);
     end;
   end;
  Case Dir Of
    cbdDroite : Inc(Y, Mul);
    cbdHaut : Inc(X, Mul);
    cbdGauche : Dec(Y, Mul);
    cbdBas : Dec(X, Mul);
  End;
 end;
END;

CONST

{ Table de codage en barres des 44 (43 + la marque de fin) caractères Code39
  Les bits à 1 représentent une barre noire et ceux à 0 une barre blanche
  Le bit de poids faible est dessiné à gauche, chaque caractère étant représenté par 16 bits }
TblBarresC39 : Array[0..43] Of Word =
 ($5DC5{101000111011101},
  $7517{111010001010111},
  $751D{101110001010111},
  $5477{111011100010101},
  $75C5{101000111010111},
  $5717{111010001110101},
  $571D{101110001110101},
  $7745{101000101110111},
  $5D17{111010001011101},
  $5D1D{101110001011101},
  $7457{111010100010111},
  $745D{101110100010111},
  $5177{111011101000101},
  $7475{101011100010111},
  $51D7{111010111000101},
  $51DD{101110111000101},
  $7715{101010001110111},
  $5C57{111010100011101},
  $5C5D{101110100011101},
  $5C75{101011100011101},
  $7157{111010101000111},
  $715D{101110101000111},
  $4577{111011101010001},
  $7175{101011101000111},
  $45D7{111010111010001},
  $45DD{101110111010001},
  $71D5{101010111000111},
  $4757{111010101110001},
  $475D{101110101110001},
  $4775{101011101110001},
  $7547{111000101010111},
  $7571{100011101010111},
  $55C7{111000111010101},
  $75D1{100010111010111},
  $5747{111000101110101},
  $5771{100011101110101},
  $7751{100010101110111},
  $5D47{111000101011101},
  $5D71{100011101011101},
  $5111{100010001000101},
  $4511{100010001010001},
  $4451{100010100010001},
  $4445{101000100010001},
  $5DD1{100010111011101});

{ Table de codage en barres des 106 caractères Code128
  Les bits à 1 représentent une barre noire et ceux à 0 une barre blanche
  Le bit de poids faible est dessiné à gauche,
  chaque caractère étant représenté par 11 bits, sauf le dernier qui en comporte 13 }
TblBarresC128 : Array[0..106] Of Word =
 ($019B{11011001100},
  $01B3{11001101100},
  $0333{11001100110},
  $00C9{10010011000},
  $0189{10010001100},
  $0191{10001001100},
  $0099{10011001000},
  $0119{10011000100},
  $0131{10001100100},
  $0093{11001001000},
  $0113{11001000100},
  $0123{11000100100},
  $01CD{10110011100},
  $01D9{10011011100},
  $0399{10011001110},
  $019D{10111001100},
  $01B9{10011101100},
  $0339{10011100110},
  $0273{11001110010},
  $01D3{11001011100},
  $0393{11001001110},
  $013B{11011100100},
  $0173{11001110100},
  $03B7{11101101110},
  $0197{11101001100},
  $01A7{11100101100},
  $0327{11100100110},
  $0137{11101100100},
  $0167{11100110100},
  $0267{11100110010},
  $00DB{11011011000},
  $031B{11011000110},
  $0363{11000110110},
  $00C5{10100011000},
  $00D1{10001011000},
  $0311{10001000110},
  $008D{10110001000},
  $00B1{10001101000},
  $0231{10001100010},
  $008B{11010001000},
  $00A3{11000101000},
  $0223{11000100010},
  $00ED{10110111000},
  $038D{10110001110},
  $03B1{10001101110},
  $00DD{10111011000},
  $031D{10111000110},
  $0371{10001110110},
  $0377{11101110110},
  $038B{11010001110},
  $03A3{11000101110},
  $00BB{11011101000},
  $023B{11011100010},
  $03BB{11011101110},
  $00D7{11101011000},
  $0317{11101000110},
  $0347{11100010110},
  $00B7{11101101000},
  $0237{11101100010},
  $02C7{11100011010},
  $02F7{11101111010},
  $0213{11001000010},
  $028F{11110001010},
  $0065{10100110000},
  $0185{10100001100},
  $0069{10010110000},
  $0309{10010000110},
  $01A1{10000101100},
  $0321{10000100110},
  $004D{10110010000},
  $010D{10110000100},
  $0059{10011010000},
  $0219{10011000010},
  $0161{10000110100},
  $0261{10000110010},
  $0243{11000010010},
  $0053{11001010000},
  $02EF{11110111010},
  $0143{11000010100},
  $02F1{10001111010},
  $01E5{10100111100},
  $01E9{10010111100},
  $03C9{10010011110},
  $013D{10111100100},
  $0179{10011110100},
  $0279{10011110010},
  $012F{11110100100},
  $014F{11110010100},
  $024F{11110010010},
  $03DB{11011011110},
  $037B{11011110110},
  $036F{11110110110},
  $00F5{10101111000},
  $03C5{10100011110},
  $03D1{10001011110},
  $00BD{10111101000},
  $023D{10111100010},
  $00AF{11110101000},
  $022F{11110100010},
  $03DD{10111011110},
  $03BD{10111101110},
  $03D7{11101011110},
  $03AF{11110101110},
  $010B{11010000100},
  $004B{11010010000},
  $01CB{11010011100},
  $1AE3{1100011101011});

{ Table de codage en barres des 30 caractères CodeEAN13
  Les bits à 1 représentent une barre noire et ceux à 0 une barre blanche
  Le bit de poids faible est dessiné à gauche, chaque caractère étant représenté par 8 bits }
TblBarresEAN13 : Array[0..29] Of Word =
 ($58{0001101},
  $4C{0011001},
  $64{0010011},
  $5E{0111101},
  $62{0100011},
  $46{0110001},
  $7A{0101111},
  $6E{0111011},
  $76{0110111},
  $68{0001011},
  $72{0100111},
  $66{0110011},
  $6C{0011011},
  $42{0100001},
  $5C{0011101},
  $4E{0111001},
  $50{0000101},
  $44{0010001},
  $48{0001001},
  $74{0010111},
  $27{1110010},
  $33{1100110},
  $1B{1101100},
  $21{1000010},
  $1D{1011100},
  $39{1001110},
  $05{1010000},
  $11{1000100},
  $09{1001000},
  $17{1110100});

TblBarresC25 : Array[0..9] Of Byte = // 0 => barre étroite, 1 => Barre large
 ($0C{00110},
  $11{10001},
  $12{01001},
  $03{11000},
  $14{00101},
  $05{10100},
  $06{01100},
  $18{00011},
  $09{10010N},
  $0A{01010});


TbfFont5x7 : Array[0..69] Of Byte =
 ($0E{01110 000},
  $11{10001 000},
  $19{10011 000},
  $15{10101 000},
  $13{11001 000},
  $11{10001 000},
  $0E{01110 000},

  $04{00100 000},
  $06{01100 000},
  $05{10100 000},
  $04{00100 000},
  $04{00100 000},
  $04{00100 000},
  $1F{11111 000},
  $0E{01110 000},

  $11{10001 000},
  $10{00001 000},
  $0C{00110 000},
  $02{01000 000},
  $01{10000 000},
  $1F{11111 000},

  $1F{11111 000},
  $08{00010 000},
  $04{00100 000},
  $08{00010 000},
  $10{00001 000},
  $11{10001 000},
  $0E{01110 000},

  $04{00100 000},
  $04{00100 000},
  $02{01000 000},
  $02{01000 000},
  $09{10010 000},
  $1F{11111 000},
  $08{00010 000},

  $1F{11111 000},
  $01{10000 000},
  $01{10000 000},
  $0F{11110 000},
  $10{00001 000},
  $11{10001 000},
  $0E{01110 000},

  $0C{00110 000},
  $02{01000 000},
  $01{10000 000},
  $0F{11110 000},
  $11{10001 000},
  $11{10001 000},
  $0E{01110 000},

  $1F{11111 000},
  $08{00010 000},
  $04{00100 000},
  $02{01000 000},
  $02{01000 000},
  $01{10000 000},
  $01{10000 000},

  $0E{01110 000},
  $11{10001 000},
  $11{10001 000},
  $0E{01110 000},
  $11{10001 000},
  $11{10001 000},
  $0E{01110 000},

  $0E{01110 000},
  $11{10001 000},
  $11{10001 000},
  $1E{01111 000},
  $10{00001 000},
  $08{00010 000},
  $0C{00110 000});

TbfFont5x6 : Array[0..59] Of Byte =
 ($0E{01110 000},
  $19{10011 000},
  $15{10101 000},
  $15{10101 000},
  $13{11001 000},
  $0E{01110 000},

  $04{00100 000},
  $06{01100 000},
  $05{10100 000},
  $04{00100 000},
  $04{00100 000},
  $1F{11111 000},

  $0E{01110 000},
  $11{10001 000},
  $08{00010 000},
  $04{00100 000},
  $02{01000 000},
  $1F{11111 000},

  $0F{11110 000},
  $10{00001 000},
  $10{00001 000},
  $0E{01110 000},
  $10{00001 000},
  $0F{11110 000},

  $11{10001 000},
  $11{10001 000},
  $11{10001 000},
  $1F{11111 000},
  $10{00001 000},
  $10{00001 000},

  $1F{11111 000},
  $01{10000 000},
  $0E{01110 000},
  $10{00001 000},
  $10{00001 000},
  $0F{11110 000},

  $1E{01111 000},
  $01{10000 000},
  $0F{11110 000},
  $11{10001 000},
  $11{10001 000},
  $0E{01110 000},

  $1F{11111 000},
  $08{00010 000},
  $04{00100 000},
  $04{00100 000},
  $02{01000 000},
  $02{01000 000},

  $0E{01110 000},
  $11{10001 000},
  $0E{01110 000},
  $11{10001 000},
  $11{10001 000},
  $0E{01110 000},

  $0E{01110 000},
  $11{10001 000},
  $1E{01111 000},
  $10{00001 000},
  $11{10001 000},
  $0E{01110 000});


PROCEDURE DessinCode39(S : String; CA : TCanvas; Dir : TCBDirection; X, Y, H, Mul : Integer; CheckSum : Boolean);
Var
I,M	: Integer;
SGZ	: String;
C	: Char;
BEGIN
SGZ := GZCode39(S, CheckSum);
If SGZ = '' Then Exit;
For I := 1 To Length(SGZ) Do
 begin
  C := SGZ[I];
  Case C Of
    '0'..'9' : M := Ord(C) - 48;
    'A'..'Z' : M := Ord(C) - 55;
    '-' : M := 36;
    '.' : M := 37;
    ' ' : M := 38;
    '$' : M := 39;
    '/' : M := 40;
    '+' : M := 41;
    '%' : M := 42;
    '*' : M := 43;
  End;
  DessineBloc(TblBarresC39[M], CA, Dir, X, Y, H, Mul, 16);
 end;
END;


PROCEDURE DessinCode128(S : String; CA : TCanvas; Dir : TCBDirection; X, Y, H, Mul : Integer);
Var
I	: Integer;
SGZ	: String;

Function ValChar(C : Char) : Integer;
{ Détermine la position dans la table TblBarres128 du caractère codé par GZCode128 }
Begin
Case C Of
  ' '..#126 : Result := Ord(C) - 32;
  #195..#211 : Result := Ord(C) - 100;
  Else Result := 0;
End;
End;

BEGIN
If S = '' Then Exit;
SGZ := GZCode128(S);
If SGZ = '' Then Exit;
For I := 1 To Pred(Length(SGZ)) Do
  DessineBloc(TblBarresC128[ValChar(SGZ[I])], CA, Dir, X, Y, H, Mul, 11);
DessineBloc($1AE3, CA, Dir, X, Y, H, Mul, 13);
END;


PROCEDURE DessinCode25(S : String; CA : TCanvas; Dir : TCBDirection; X, Y, H, Mul : Integer);
{ Trace le code à barres (Code 2 de 5) de la chaine S
  Puisque le nombre de caractères représentés par un Code 2 de 5 doit être pair,
  si la longuer de S est impaire, la somme de contrôle sera ajoutée à la fin,
  elle ne sera pas ajoutée si la longueur est paire }
Var
I,J,R,E,L,
M,A1,A2	: Integer;
BEGIN
If S = '' Then Exit;
L := Length(S);
E := 0; // Somme des caractères pairs
R := 0; // Somme des caractères impairs
For I := 1 To L Do // Calcul de la somme de contrôle
 begin
  If Not (S[I] In ['0'..'9']) Then Exit; // Sortir si caractère non numérique
  If Odd(I)
  Then Inc(R, Ord(S[I]) - 48)
  Else Inc(E, Ord(S[I]) - 48);
 end;
Inc(E, R * 3);
E := (10 - (E Mod 10)) Mod 10;
DessineBloc($05, CA, Dir, X, Y, H, Mul, 4); // Marque de début 1010
// Boucle sur les paires de caractères
I := 1;
While I <= L Do
 begin
  M := 1;
  R := 0;
  A1 := TblBarresC25[Ord(S[I]) - 48];
  If I < L
  Then A2 := TblBarresC25[Ord(S[I + 1]) - 48]
  Else A2 := TblBarresC25[E];
  For J := 1 To 5 Do
   begin
    Inc(R, M);
    Inc(M, M);
    If Odd(A1)
    Then
     begin
      Inc(R, M);
      Inc(M, M);
      Inc(R, M);
      Inc(M, M);
     end;
    Inc(M, M);
    If Odd(A2) Then M := M Shl 2;
    A1 := A1 Shr 1;
    A2 := A2 Shr 1;
   end;
  DessineBloc(R, CA, Dir, X, Y, H, Mul, 18);
  Inc(I, 2);
 end;
DessineBloc($0B, CA, Dir, X, Y, H, Mul, 4); // Marque de fin 1101
END;


PROCEDURE DessinCodeEAN13(S : String; CA : TCanvas; Dir : TCBDirection;
		X, Y, H, Mul : Integer; Clair : Boolean = True);
Var
XX,YY,
I	: Integer;
SGZ	: String;

Function ValChar(C : Char) : Integer;
{ Détermine la position dans la table TblBarresEAN13 du caractère codé par GZCodeEAN13 }
Begin
Case C Of
  #65..#84 : Result := Ord(C) - 65;
  #97..#106 : Result := Ord(C) - 77;
  Else Result := 0;
End;
End;

BEGIN
If Length(S) <> 12 Then Exit;
SGZ := GZCodeEAN13(S);
If SGZ = '' Then Exit;

If Clair
Then
 begin
  Case Dir Of // Détermine la position du premier caractère
    cbdDroite :
     begin
      XX := X - 1;
      YY := Y;
     end;
    cbdHaut :
     begin
      YY := Y + 1;
      XX := X;
     end;
    cbdGauche :
     begin
      XX := X + 1;
      YY := Y;
     end;
    cbdBas :
     begin
      YY := Y - 1;
      XX := X;
     end;
  End;
  DessineCaractere(TbfFont5x7[(Ord(S[1]) - 48) * 7], CA, Dir, XX, YY, H, Mul, 5, 7);
  Case Dir Of
    cbdDroite : Inc(X, 6 * Mul);
    cbdHaut : Dec(Y, 6 * Mul);
    cbdGauche : Dec(X, 6 * Mul);
    cbdBas : Inc(Y, 6 * Mul);
  End;
 end;
DessineBloc($05, CA, Dir, X, Y, H + 5, Mul, 3);
For I := 2 To 7 Do
 begin
  If Clair Then DessineCaractere(TbfFont5x7[(Ord(S[I]) - 48) * 7], CA, Dir, X, Y, H, Mul, 5, 7);
  DessineBloc(TblBarresEAN13[ValChar(SGZ[I])], CA, Dir, X, Y, H, Mul, 7);
 end;
DessineBloc($0A, CA, Dir, X, Y, H + 5, Mul, 5);
For I := 9 To 14 Do
 begin
  If Clair Then DessineCaractere(TbfFont5x7[(Ord(SGZ[I]) - 97) * 7], CA, Dir, X, Y, H, Mul, 5, 7);
  DessineBloc(TblBarresEAN13[ValChar(SGZ[I])], CA, Dir, X, Y, H, Mul, 7);
 end;
DessineBloc($05, CA, Dir, X, Y, H + 5, Mul, 3);
END;


function calc_CodeEAN13(s:string): string;
var i,j, LC, cv, cs1, cs2,cs,nz:integer;
c_n:boolean;
scs:string;
begin
 LC:=12;
 If Length(S) > LC Then Exit;
 if  Length(S) < LC then // äîïîëíèòü ñòàðøèå ðàçðÿäû êîäîì ñòðàíû 482 è îñòàëüíîå íóëÿìè
 begin
  nz:=12-Length(S); // êîë-âî äîïîëíÿåìûõ íóëåé âïåðåäè
  for j:=1 to nz do s:='0'+s;
  s[1]:='4';
  s[2]:='8';
  s[3]:='2';
 end;


 cs1:=0;
 cs2:=0;
 i := LC;
 c_n:=True;
 while i >= 1  do
 begin
  cv:=StrToInt(s[i]);
  if c_n then  cs2:=cs2+cv
  else cs1:=cs1+cv;
  Dec(i);
  c_n:= not c_n;
 end;
 cs2:=cs2*3;
 cs:=cs1+cs2;
 scs:= IntToStr(cs);
 cv:=StrToInt(scs[Length(scs)]);
 cs:=10-cv;
 if cs=10 then cs:=0;
 result:=s+IntToStr(cs);
end;

END.
