generic
   
   type Tipoelem is private;
   with function "<" (X, Y: Tipoelem) return Boolean;
   with function ">" (X, Y: Tipoelem) return Boolean;
   with procedure Put (X: in TipoElem);
   
   package Arbol_Grupo7 is
      
      type Tipoarbol is private;
      
	  function Vacio (Raiz: Tipoarbol) return Boolean;
      procedure Insertar(Raiz: in out Tipoarbol; Elemento: in Tipoelem);
      procedure Suprimir(Arbol: in out TipoArbol; ValSup: in TipoElem);
      function Esta(Raiz: in TipoArbol; Buscado: in TipoElem) return Boolean;
      procedure Limpiar(Ptr: in out TipoArbol);
      function Izq(Ptr: TipoArbol) return TipoArbol;
      function Der(Ptr: TipoArbol) return TipoArbol;
      function Info(Ptr: Tipoarbol) return Tipoelem;
      
	  Arbolvacio: exception;
   
      private
      
      type Tiponodo;
      type Tipoarbol is access Tiponodo;
      type Tiponodo is
      record
         Info: Tipoelem;
         Izq, Der: Tipoarbol;
   end record;
   
end Arbol_Grupo7;