package Exceptions;

public class NoUserException extends RuntimeException {
    public NoUserException(String str) {
        super(str);
    }
}
