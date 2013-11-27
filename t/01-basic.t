use v6;
use Math::ChebyshevPolynomial;
use Test;

plan 6;

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