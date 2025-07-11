import {
  Request as ExpressRequest,
  Response as ExpressResponse,
} from "express";

export type DTO = {
  params: any;
  query: any;
  body: any;
  response: any;
};

export type Request<P extends Partial<DTO> = DTO> = ExpressRequest<
  P["params"],
  P["response"],
  P["body"],
  P["query"]
>;

export type ErrorResponse = {
  /**
   * A message describing the error.
   */
  message: string;
  /**
   * The actual error message from the system
   */
  error?: any;
};

export type Response<P extends Partial<DTO> = DTO> = ExpressResponse<
  ErrorResponse | P["response"]
>;
export type ISO8601Duration = `P${`${number}Y` | ""}${`${number}M` | ""}${
  | `${number}D`
  | ""}${"T" | ""}${`${number}H` | ""}${`${number}M` | ""}${`${number}S` | ""}`;
