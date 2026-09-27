# Security scope and limitations

This repository demonstrates an XOR-based text transformation implemented in x86 assembly. **XOR with a simple or reused key is not secure encryption for sensitive information.** Do not use this tool to protect passwords, personal information or production data.

## Educational objectives
- Explore assembly-language programming and bitwise operations.
- Understand how XOR transforms data and why applying the same key can reverse the transformation.
- Learn to distinguish a working demonstration from a secure cryptographic system.

## Threat model and limitations
A basic XOR implementation provides no established confidentiality guarantees when keys are short, predictable or reused. It does not provide integrity protection or authenticated encryption. Repeated patterns and known plaintext can expose the key or message.

For real applications, use a well-maintained cryptographic library and an established authenticated-encryption scheme rather than designing your own cryptography.

## Safe verification plan
Use synthetic input fixtures. Document test vectors, empty input handling, round-trip correctness, boundary cases and encoding limitations. Verify the implementation and report actual results before adding passing-test badges.

## Connection to technical AI safety
This exercise illustrates an important engineering principle: successful execution is not evidence of security. Technical AI evaluations similarly require clear threat models, adversarial tests and careful reporting of limitations. This project is not an AI safety research contribution.
