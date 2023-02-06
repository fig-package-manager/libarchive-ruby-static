#include <errno.h>
#include <archive.h>

static struct {
  int code;
  int (*setter)(struct archive *);
} codes[] = {
  { ARCHIVE_FILTER_NONE,     archive_read_support_filter_none     },
  { ARCHIVE_FILTER_GZIP,     archive_read_support_filter_gzip     },
  { ARCHIVE_FILTER_BZIP2,    archive_read_support_filter_bzip2    },
  { ARCHIVE_FILTER_COMPRESS, archive_read_support_filter_compress },
  // XXX:
  /*
  { ARCHIVE_FILTER_PROGRAM,  archive_read_support_filter_program  },
  { ARCHIVE_FILTER_LZMA,     archive_read_support_filter_lzma     },
  */
  { -1,                           NULL                                      },
};

int archive_read_support_compression(struct archive *a, int code) {
  int i;

  for (i = 0; codes[i].code >= 0; i++) {
    if (codes[i].code == code) {
      return codes[i].setter(a);
    }
  }

  archive_set_error(a, EINVAL, "No such compression");
  return ARCHIVE_FATAL;
}
