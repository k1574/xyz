# Quadratic equation \ Kvadratika ekvacio \ Квадратное уравнение

	a*x^2 + b*x + c = 0
	D = b^2 - 4*a*c

	1) x = (-b +- sqrt(D)) / (2*a) ;
		<=>
	2) [
		x1 = (-b^2 + sqrt(D)) / (2*a), 
		x2 = (-b^2 - sqrt(D)) / (2*a).
	]
	3) {
		x1+x2 = -b/a ,
		x1*x2 = c/a . 
	}
	4) {
		x^2 + px + q = 0,
		x1+x2 = -p ,
		x2*x2 = q .
	}

---

	1)▲
		a*x^2 + b*x + c = 0
		a^2*x^2 + a*b*x = -a*c

		a^2*x^2 + 2*(a*b*x/2) + b^2/4 = b^2/4 - a*c
		(a*x)^2 + 2*(a*x)*(b/2) + (b/2)^2 = b^2/4 - a*c

		(a*x + b/2)^2 = b^2/4 - a*c
		4*(a*x + b/2)^2 = b^2 - 4*a*c
		2*(a*x + b/2) = +-sqrt(b^2 - 4*a*c)
		2*a*x + b = +-sqrt(b^2 - 4*a*c) =
			= +-sqrt(D)

		x = ( -b +-sqrt(D) ) / (2*a)
	∎
	2)▲a priori∎
	3)▲
		x1 + x2 = (-b + sqrt(D)) / (2*a) +
			+ (-b - sqrt(D)) / (2*a) =
			= -2b/(2*a) = -b/a

		x1*x2 = (-b + sqrt(D) / (2*a)) *
			* (-b - sqrt(D)) / (2*a) =
			= (-b + sqrt(D))*(-b - sqrt(D)) / (2*a)^2 =
			= ((-b)^2 - D)/(2*a) = (b^2 + b^2 - 4*a*c) / (2*a) =
			= (b^2 - b^2 + 4*a*c) / (4*a^2) =
			= (4*a*c) / (4*a*a) = c/a
	∎

