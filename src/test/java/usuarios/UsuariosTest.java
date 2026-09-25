package usuarios;

import com.intuit.karate.junit5.Karate;

class UsuariosTest {

    @Karate.Test
    Karate testUsuarios() {
        return Karate.run(
                "listar-usuarios",
                "registrar-usuario",
                "buscar-usuario",
                "actualizar-usuario",
                "eliminar-usuario"
        ).relativeTo(getClass());
    }
}