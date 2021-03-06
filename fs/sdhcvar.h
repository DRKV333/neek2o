/*	$OpenBSD: sdhcvar.h,v 1.3 2007/09/06 08:01:01 jsg Exp $	*/

/*
 * Copyright (c) 2006 Uwe Stuehler <uwe@openbsd.org>
 * Copyright (c) 2009 Sven Peter <svenpeter@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#ifndef _SDHCVAR_H_
#define _SDHCVAR_H_

#include "bsdtypes.h"

#define SDHC_MAX_HOSTS	4

struct sdhc_host {
	struct sdhc_softc *sc;		/* host controller device */
	struct device *sdmmc;		/* generic SD/MMC device */
	bus_space_tag_t iot;		/* host register set tag */
	bus_space_handle_t ioh;		/* host register set handle */
	u_int clkbase;			/* base clock frequency in KHz */
	int maxblklen;			/* maximum block length */
	int flags;			/* flags for this host */
	u_int32_t ocr;			/* OCR value from capabilities */
	u_int8_t regs[14];		/* host controller state */
	u_int16_t intr_status;		/* soft interrupt status */
	u_int16_t intr_error_status;	/* soft error status */
	int data_command;
};

struct sdhc_softc {
	struct device sc_dev;
	struct sdhc_host sc_host[SDHC_MAX_HOSTS];
	int sc_nhosts;
	u_int sc_flags;
};


/* Host controller functions called by the attachment driver. */
int		sdhc_host_found(struct sdhc_softc *, bus_space_tag_t,
	    bus_space_handle_t, int);
void	sdhc_power(int, void *);
void	sdhc_shutdown(void *);
int		sdhc_intr(void *);
void	SDHCInit(void);
void	sdhc_irq(void);

/* flag values */
#define SDHC_F_NOPWR0		(1 << 0)

#endif
