use v6;

class Math::ChebyshevPolynomial {
    has $.domain;
    has @.c;

    method approximate(Range $domain, $n, &f) {
        my $bma = ($domain.max - $domain.min) / 2;
        my $bpa = ($domain.max + $domain.min) / 2;
        my @f = (^$n).map({ &f(cos(pi * ($_ + 1/2) / $n) * $bma + $bpa) });
        
        my $fac = 2 / $n;
        my @c;
        for ^$n -> $j {
            @c[$j] = $fac * [+] @f <<*>> (^$n).map({ cos(pi * $j * ($_ + 1/2) / $n) });
        }
        self.new(:$domain, :@c);
    }

    method evaluate($x) {
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