class Personaje{
  
  var fuerza
  var inteligencia
  var rol

  method cambiarRol(nuevoRol) {rol=nuevoRol}
  method potencialOfensivo() = fuerza*10 + rol.danoExtra() +self.brutalidadInnata()
  method esGroso() =self.esInteligente() or self.esGrosoEnSuRol() 
  method brutalidadInnata() 
  method esInteligente() 
  method esGrosoEnSuRol()   

}

class Orco inherits Personaje{

  override method brutalidadInnata() =(fuerza*10 + rol.danoExtra())*0.1
  override method esInteligente()=false
  override method esGrosoEnSuRol()=rol.esGrosoElPersonaje(self)

}

class Humano inherits Personaje{

  override method brutalidadInnata()=0
  override method esInteligente()=inteligencia>50
  override method esGrosoEnSuRol()=rol.esGrosoElPersonaje(self)

}

class Mascota {
  
  var fuerza
  var edad
  var tieneGarras

  method potencialOfensivo() =if(tieneGarras)fuerza*2 else fuerza


}


//-------------roles--------------------

object guerrero {

  method danoExtra() =100 
  method esGrosoElPersonaje(unPersonaje)=unPersonaje.fuerza()>50
  
}


class Cazador {

  var property mascota

  method domarNuevaMascota(fuerza,edad,tieneGarras) {
    const nuevaMascota=new Mascota(fuerza=fuerza,edad=edad,tieneGarras=tieneGarras)
  }

  method danoExtra() =mascota.potencialOfensivo() 
  method esGrosoElPersonaje(unPersonaje)=unPersonaje.mascota().edad()>10
  
}

object brujo {

  method danoExtra() =0 
  method esGrosoElPersonaje(unPersonaje)=true
  
}

//------------------localidades----------------------

class Localidad{
  
  var cantMaximaDeHabitantes
  const ejercito=[]

}

class Ciudad inherits Localidad{

}

class Aldea inherits Localidad{


}

//--------------------ejercito-------------------


class Ejercito{

  const personajes=#{}

  method AgregarPersonaje(unPersonaje) {personajes.add(unPersonaje)}
  method quitarPersonaje(unPersonaje) {personajes.remove(unPersonaje)}

  method potencialOfensivo() =personajes.sum({p=>p.potencialOfensivo()}) 

}
