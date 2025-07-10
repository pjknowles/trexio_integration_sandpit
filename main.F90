program trexio_integration_sandpit
#include <my_header.f90>
!    use my_module, only : my_module_message => message
    use trexio
    call trexio_assert(1, 1, "success")
!    write(*, *) my_module_message
    write(*, *) message
end program
