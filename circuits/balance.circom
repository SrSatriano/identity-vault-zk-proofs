pragma circom 2.0.0;

include "circomlib/comparators.circom";

template BalanceProof() {
    signal input balance;
    signal input threshold;
    signal output valid;

    component gte = GreaterEqThan(64);
    gte.in[0] <== balance;
    gte.in[1] <== threshold;
    valid <== gte.out;
}

component main { public [threshold] } = BalanceProof();
