with Ada.Integer_Text_Io,Ada.Text_Io,Arbol_Grupo7; use Ada.Integer_Text_Io,Ada.Text_Io;

procedure Pco5_Ej7_Grupo7 is

  
   procedure Temp(x: in integer) is
   begin
      put(x);
      end temp;
   
   package Arbolinc is new Arbol_Grupo7(Integer,"<", ">",temp);
   use Arbolinc;
   arbol:tipoarbol;

begin
  
   Put_Line("Insertamos los elementos 5,2,7,1,3,6,9 en un arbol");
   New_Line;
   
    Insertar(Arbol, 5);
    Insertar(Arbol, 2);
    Insertar(Arbol, 7);
    Insertar(Arbol, 1);
    Insertar(Arbol, 3);
    Insertar(Arbol, 6);
    Insertar(Arbol, 9);
      
      if Esta(Arbol, 9) then
        Put_Line("El elemento 9 está en el árbol.");
   new_line;
   end if;
   
  while not Vacio(Arbol) loop
      Put(Info(Arbol));
      suprimir(arbol,Info(Arbol));
   end loop;

end Pco5_Ej7_Grupo7;
