with Ada.Unchecked_Deallocation;
package body Arbol_Grupo7 is
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo, Tipoarbol);
   
   function Vacio (Raiz: Tipoarbol) return Boolean is
   begin
      return Raiz = null;
   end Vacio;
   
   procedure Limpiar (Ptr: in out Tipoarbol) is
   begin
      if not Vacio (Ptr) then
         Limpiar(Ptr.Izq);
         Limpiar(Ptr.Der);
         Free(Ptr);
      end if;
   end Limpiar;
   
   procedure Insertar (Raiz: in out Tipoarbol; Elemento: in Tipoelem) is
   begin
      if Raiz = null then Raiz:= new Tiponodo'(Elemento, null, null);
      elsif Elemento < Raiz.Info then Insertar (Raiz.Izq, Elemento);
      else Insertar (Raiz.Der, Elemento);
      end if;
   end Insertar;
   
   procedure Suprimirnodo (Ptr: in out Tipoarbol) is
      Anterior: Tipoarbol;
      Temp: Tipoarbol:= Ptr;
   begin
      if Ptr.Der = null
            then Ptr:=Ptr.Izq;
      else if Ptr.Izq = null
               then Ptr:= Ptr.Der;
         else
            Temp:= Ptr.Izq;
            Anterior:= Ptr;
            while Temp.Der /= null loop
               Anterior:= Temp;
               Temp:= Temp.Der;
            end loop;
            Ptr.Info:= Temp.Info;
            if Anterior = Ptr then Anterior.Izq:= Temp.Izq;
            else Anterior.Der:= Temp.Izq;
            end if;
         end if;
      end if;
      Free(Temp);
   end Suprimirnodo;
        

   procedure Suprimir (Arbol: in out Tipoarbol; Valsup: in Tipoelem) is
   begin
      if Arbol = null then raise Arbolvacio;
      elsif Valsup = Arbol.Info then Suprimirnodo(Arbol);
      elsif Valsup < Arbol.Info then Suprimir(Arbol.Izq, Valsup);
      else Suprimir(Arbol.Der, Valsup);
      end if;
   end Suprimir;
   

   function Esta  (Raiz: in Tipoarbol; Buscado: in Tipoelem) return Boolean is-- recursiva
   begin
      if Vacio(Raiz) then return False;
      else if Raiz.Info = Buscado then return True;
         else if Raiz.Info > Buscado then return Esta(Raiz.Izq, Buscado);
            else return Esta(Raiz.Der, Buscado);
            end if;
         end if;
      end if;
   end Esta;
   

   function Izq (Ptr: Tipoarbol) return Tipoarbol is
   begin
      if Vacio(Ptr) then raise Arbolvacio;
      else return Ptr.Izq;
      end if;
   end Izq;
   

   function Der (Ptr: Tipoarbol) return Tipoarbol is
   begin
      if Vacio(Ptr) then raise Arbolvacio;
      else return Ptr.Der;
      end if;
   end Der;
   

   function Info (Ptr: Tipoarbol) return Tipoelem is
   begin
      if Vacio(Ptr) then raise Arbolvacio;
      else return Ptr.Info;
      end if;
   end Info;
 
 
   end Arbol_Grupo7;