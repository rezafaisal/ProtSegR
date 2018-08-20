\name{ConvertToFeatureRepresentation}
\alias{ConvertToFeatureRepresentation}
\title{ConvertToFeatureRepresentation}
\description{
This function generate feature representation from original sequence, adjacent and overlapped segments.
}
\usage{
ConvertToFeatureRepresentation(seq_str, z, prot_desc)
}
\arguments{
\item{seq_str}{Protein sequence.}
\item{z}{Divider value. If z=2, it will generate additional segment by using k=2. But if z=3, it will generate additional segments by using k=2 and k=3.}
\item{prot_desc}{Protein descriptor type.}
}
\examples{
ConvertToFeatureRepresentation("RSVTTEINTLFQTLTSIAEKVDP", 2, "AAC,DC")
}
