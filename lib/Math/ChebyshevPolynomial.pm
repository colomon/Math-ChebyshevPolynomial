use v6;

class Math::ChebyshevPolynomial {
    has $.domain;
    has @.c;
    
    method Evaluate($x) {
        die '$x not in range in Math::ChebyshevPolynomial::Evaluate' unless $x ~~ $.domain;
        my $y = (2 * $x - $.domain.min - $.domain.max) / ($.domain.max - $.domain.min);
        my $y2 = 2 * $y;
        my $d = 0.0;
        my $dd = 0.0;
        for (1..(@.c - 1)).reverse -> $j {
            ($d, $dd) = ($y2 * $d - $dd + @.c[$j], $d);
        }
        $y * $d - $dd + @.c[0] / 2;
    }
}