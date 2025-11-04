class Personaje{

  var fuerza 
  var inteligencia
  var rol
  var esHumano


  method cambiarRol(nuevoRol) {
    rol=nuevoRol
  }

  method esinteligente()= if(!esHumano)false else inteligencia>50
  method esGrosoEnSuRol()   

  method potencialOfensivo() =fuerza*10 
  method esGroso() = self.esinteligente() or self.esGrosoEnSuRol()


}

class Guerrero inherits Personaje {
  
  override method potencialOfensivo() =super() + 100
  override method esGrosoEnSuRol()= fuerza>50
}


class Cazador inherits Personaje {
  
  var mascota

  override method potencialOfensivo() = super() + mascota.potencialOfensivo() 
  override method esGrosoEnSuRol()= mascota.edad()>10


}

class Orcos  inherits Personaje{

  override method potencialOfensivo() = super() + (super()*0.10 )
  override method esGrosoEnSuRol()= true
  
}


class Brujo inherits Personaje {

  override method esGrosoEnSuRol()= true
  
}


class Mascota {
  
  var fuerza
  var edad
  var garras

  method potencialOfensivo() = if(garras) fuerza*2 else fuerza


}