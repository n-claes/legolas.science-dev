! =============================================================================
!> Module that contains the implementation of nodes in the linked-list matrix
!! representation.
module mod_matrix_node
  use mod_global_variables, only: dp, NaN
  use mod_logging, only: log_message
  implicit none

  private

  !> Base node corresponding to a given column - value pair for a given row
  type, public :: node_t
    !> column index
    integer :: column
    !> complex value for the matrix element
    complex(dp), private :: element
    !> pointer to next node
    class(node_t), pointer :: next

    contains

    procedure :: add_to_node_element
    procedure :: multiply_node_element_with
    procedure :: get_node_element
    procedure :: delete
  end type node_t

  public :: new_node

contains

  !> Constructor for a new node, sets the column and element attributes.
  !! The element passed is polymorphic, but will be cast to complex in the node itself.
  !! No nodes are linked yet; the pointer to the next node is initialised to `null()`.
  pure function new_node(column, element) result(node)
    !> column index
    integer, intent(in) :: column
    !> element added to the node
    class(*), intent(in) :: element
    !> new node with given column and element attributes
    type(node_t) :: node

    select type(element)
      type is (complex(dp))
        node%element = element
      type is (real(dp))
        node%element = cmplx(element, kind=dp)
      type is (integer)
        node%element = cmplx(element, kind=dp)
    end select

    node%column = column
    node%next => null()
  end function new_node


  !> Destructor, deallocates the node attributes.
  pure subroutine delete(this)
    !> type instance
    class(node_t), intent(inout) :: this

    nullify(this%next)
  end subroutine delete


  !> Adds a given element to the node element, does type-checking of the polymorphic
  !! element given. Allowed types are complex, real, integer.
  subroutine add_to_node_element(this, element)
    !> type instance
    class(node_t), intent(inout) :: this
    !> element to add to the existing element
    class(*), intent(in) :: element

    select type(element)
      type is (complex(dp))
        this%element = this%element + element
      type is (real(dp))
        this%element = this%element + cmplx(element, kind=dp)
      type is (integer)
        this%element = this%element + cmplx(element, kind=dp)
    end select
  end subroutine add_to_node_element


  !> Multiplies the node element with a given number, does type-checking of the
  !! polymorphic number given. Allowed types are complex, real, integer.
  subroutine multiply_node_element_with(this, number)
    !> type instance
    class(node_t), intent(inout) :: this
    !> number to multiply the element with
    class(*), intent(in) :: number

    select type(number)
      type is (complex(dp))
        this%element = this%element * number
      type is (real(dp))
        this%element = this%element * cmplx(number, kind=dp)
      type is (integer)
        this%element = this%element * cmplx(number, kind=dp)
    end select
  end subroutine multiply_node_element_with


  !> Returns the node element.
  pure function get_node_element(this) result(element)
    !> type instance
    class(node_t), intent(in) :: this
    !> node element
    complex(dp) :: element

    element = this%element
  end function get_node_element

end module mod_matrix_node
