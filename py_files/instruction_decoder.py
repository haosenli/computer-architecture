def instruction_decoder(instruction: list[int]):
    """Decodes a 32-bit ARM instruction.
    
    Args:
        instruction: A list of 32 boolean ints.
        
    Returns:
        A dict of instructions.
    """
    result = {}
    op_code = instruction[:11]
    # filter out 
    
    