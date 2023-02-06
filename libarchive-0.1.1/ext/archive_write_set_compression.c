#include <errno.h>
#include <archive.h>

static struct {
  int code;
  int (*setter)(struct archive *);
} codes[] = {
  { ARCHIVE_FILTER_NONE,     archive_write_add_filter_none     },
  { ARCHIVE_FILTER_GZIP,     archive_write_add_filter_gzip     },
  { ARCHIVE_FILTER_BZIP2,    archive_write_add_filter_bzip2    },
#if ARCHIVE_VERSION_NUMBER >= 2005000
  { ARCHIVE_FILTER_COMPRESS, archive_write_add_filter_compress },
#endif
  // XXX:
  /*
  { ARCHIVE_FILTER_PROGRAM,  archive_read_support_filter_program  },
  */
  { -1,                           NULL                                      },
};

int archive_write_set_compression(struct archive *a, int code) {
  int i;

  for (i = 0; codes[i].code >= 0; i++) {
    if (codes[i].code == code) {
      return codes[i].setter(a);
    }
  }

  archive_set_error(a, EINVAL, "No such compression");
  return ARCHIVE_FATAL;
}
