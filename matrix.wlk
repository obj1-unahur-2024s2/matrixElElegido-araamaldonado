object neo {
    var energia = 100

    method energia() = energia

    method esElElegido() = true

    method saltar() {
        energia -= energia * 0.5
    }

    method vitalidad() = energia * 0.1
}


object morfeo {
    var vitalidad = 8

    var estaCansado = false

    method estaCansado() = estaCansado

    method esElElegido() = false

    method vitalidad() = vitalidad

    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = !estaCansado
    }
}


object trinity {
    method vitalidad() = 0

    method saltar() {}

    method esElElegido() = false
}


object nave {
    const property pasajeros = [neo, morfeo, trinity]

    method subirA(unPasajero) {
        pasajeros.add(unPasajero)
    }

    method bajarA(unPasajero) {
        pasajeros.remove(unPasajero)
    }

    method cantidadPasajeros() = pasajeros.size() 

    method pasajeroMasVital() = pasajeros.max({p => p.vitalidad()})

    method estaElElegido() = pasajeros.any({p => p.esElElegido()})

    method vitalidadEstaEquilibrada() = self.pasajeroMasVital().vitalidad() <= 
        self.pasajeroMenosVital().vitalidad() * 2

    method pasajeroMenosVital() = pasajeros.min({p => p.vitalidad()})

    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear() // pasajeros.forEach({p => self.bajarA(p)}) , y tambien se puede poner arriba
    }

    method acelerar() {
        self.pasajerosSinElElegido().forEach({p => p.saltar()})
    }

    method pasajerosSinElElegido() {
        return pasajeros.filter({p => !p.esElElegido()})
    }
}