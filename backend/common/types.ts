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

export type Request<P extends DTO = DTO> = ExpressRequest<
  P["params"],
  P["response"],
  P["body"],
  P["query"]
>;

export type ErrorResponse = {
  message: string;
  error?: any;
};

export type Response<P extends DTO = DTO> = ExpressResponse<
  P["response"] | ErrorResponse
>;

export type ISO8601Duration = `P${`${number}Y` | ""}${`${number}M` | ""}${
  | `${number}D`
  | ""}${"T" | ""}${`${number}H` | ""}${`${number}M` | ""}${`${number}S` | ""}`;
