function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
}

// console.log(madLib('make', 'best', 'guac'));


function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase)
}

// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));


//Fizzbuzz is hard
function fizzbuzz(arr) {
  var answer = [];

}

function isPrime(num) {
  for (let i = 2; i < num; i++ ) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

function sumOfNPrimes(n) {
  var sum = 0;
  var counter = 0;
  var i = 2;

  while ( counter < n ) {
    if (isPrime(i)) {
      sum += i;
      counter++;
    }
    i++;
  }
  return sum;
}

console.log(sumOfNPrimes(4))
