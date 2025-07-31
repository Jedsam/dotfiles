;; Basic assignment matching for Java
((assignment_expression
    left: (_) @assignment.lhs
    right: (_) @assignment.rhs) @assignment.outer)
