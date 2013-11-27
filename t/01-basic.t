use v6;
use Math::ChebyshevPolynomial;
use Test;

plan 1;

{
    my $cp = Math::ChebyshevPolynomial.new(:domain(-1..1), :c((42)));
    isa_ok $cp, Math::ChebyshevPolynomial, "new makes a proper object";
}