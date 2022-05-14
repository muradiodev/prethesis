package com.prethesis.util.generateresponse;

@FunctionalInterface
public interface GenerateResponse<Code, Message, Body, ResponseType> {

    ResponseType generate(Code code, Message message, Body body);

}