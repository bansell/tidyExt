#' Override conflicting functions with dplyr functions

#' @export
select <- dplyr::select

#' @export
filter <- dplyr::filter

#' @export
mutate <- dplyr::mutate

#' @export
count <- dplyr::count

#' @export
rename <- dplyr::rename

#' @export
slice <- dplyr::slice

#' @export
arrange <- dplyr::arrange

#' @export
summarize <- dplyr::summarize

#' @export
desc <- dplyr::desc
