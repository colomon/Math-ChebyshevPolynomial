use v6;
use Math::ChebyshevPolynomial;
use Test;

plan 13;

{
    my $cp = Math::ChebyshevPolynomial.new(:domain(-1..1), :c((42)));
    isa_ok $cp, Math::ChebyshevPolynomial, "new makes a proper object";
    is_approx $cp.Evaluate(0), 21, "Constant is correctly boring";
    is_approx $cp.Evaluate(1/2), 21, "Constant is still correctly boring";
}

{
    my $cp = Math::ChebyshevPolynomial.new(:domain(-1..1), :c((42, 2)));
    is_approx $cp.Evaluate(0), 21, "Linear 0 is correct";
    is_approx $cp.Evaluate(1/2), 22, "Linear 1/2 is correct";
    is_approx $cp.Evaluate(-1/2), 20, "Linear -1/2 is correct";
}

{
    my $cp = Math::ChebyshevPolynomial.new(:domain(-1..1), :c((42, 2, 3)));
    is_approx $cp.Evaluate(0), 18, "Quadratic 0 is correct";
    is_approx $cp.Evaluate(1/2), 21 + 1 - 3 / 2, "Quadratic 1/2 is correct";
    is_approx $cp.Evaluate(-1/2), 21 - 1 - 3 / 2, "Quadratic -1/2 is correct";
}

{
    my &f = -> $x { 3 * $x * $x + 2 * $x + 1 };
    my $cp = Math::ChebyshevPolynomial.Approximate(-1..1, 4, &f);
    isa_ok $cp, Math::ChebyshevPolynomial, "Approximate makes a proper object";
    say $cp.c;
    is_approx $cp.Evaluate(0), &f(0), "Quadratic 0 is correct";
    is_approx $cp.Evaluate(1/2), &f(1/2), "Quadratic 1/2 is correct";
    is_approx $cp.Evaluate(-1/2), &f(-1/2), "Quadratic -1/2 is correct";
    
}