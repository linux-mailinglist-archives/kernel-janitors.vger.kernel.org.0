Return-Path: <kernel-janitors+bounces-10115-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH5lHvURgmkgPAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10115-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:19:17 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3650DB328
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB93930D6BDB
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Feb 2026 15:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D103B52EF;
	Tue,  3 Feb 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ox/pWAO5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03353AEF5B;
	Tue,  3 Feb 2026 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131846; cv=none; b=PGWpxtj6RMFySgu9L7kQMRV2t/JNd30BJboahiNmP0icZQCgb6/W/Oyyf5/pIS88sX6IcnANcFZZ18Mzw6t4qotMz18ziFsvqofwTpBmkkwio3tw8s8pY8qoKyaqMkMIfJit6QT3xoK73+VqemTHESHZD9fLui5vBbQuQyeNGwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131846; c=relaxed/simple;
	bh=Ehmeu0Rpu77qcDr4uBHtIU/Dqxvqmqz5fj9ls5mDOFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSsQcUOvqUE7/X1ZmC1SfvaPq0vs/4qU0HqJGWyVJdDaHZnFDbttg8h+Rkr8gAwrs9ll2BLkKvQ5jk1JUMjxbD4U5yrCUMnJImqMymXYnXhbKXeikpn7BLCaJV/Bp2j68haZQdyokOlogYkpBZYI9GeapaMPaD8rsLTHA7wdlT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ox/pWAO5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770131845; x=1801667845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ehmeu0Rpu77qcDr4uBHtIU/Dqxvqmqz5fj9ls5mDOFE=;
  b=Ox/pWAO5NWUYgls9R/Io+CRXCSIGZeut+4BI6OCIhW6TsIGurL7/eDh9
   a5CZEbLgFeKxQA4pV7A8iMVaIuiXINo2P2dtfIFTWseMS3WXzJY7lNlRZ
   l7WwtPcmPQ7RI00hcBhQozhw1hD2xrS6QqiLHAgG1hk+h8j88LpdOgkLm
   QbG/NmCzXHEFFBfEjrUE5Yo4mcf1sGRqHzhWeDqiZloEzEZwuAn9TAkM2
   r/nPCnkxPFmPekCiNJvcgnzYCQNP6ra5CW2u7xSiCLLv70GLgwvzuOp+E
   w6q0LPWg+ZB0Vji7AJkv10EZVXYG8cdxSuOtJYtIBECpEP59A4ucXYLNZ
   A==;
X-CSE-ConnectionGUID: hCAVgteVQf+x6bZZ8H0CjQ==
X-CSE-MsgGUID: wBbn5peZR+KH2dftUhsx2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82414537"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82414537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:17:24 -0800
X-CSE-ConnectionGUID: c5ALK/npT/ifYG7YklZc2w==
X-CSE-MsgGUID: +LvDjWfLSjiPqenAqY3cbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="232793496"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:17:22 -0800
Date: Tue, 3 Feb 2026 17:17:19 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v3 next 2/6] iio: sca3000: reuse device pointer for devm
 helpers
Message-ID: <aYIRf6j0fXR5NcEK@smile.fi.intel.com>
References: <20260203122109.689669-1-harshit.m.mogalapalli@oracle.com>
 <20260203122109.689669-3-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203122109.689669-3-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10115-lists,kernel-janitors=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,kernel-janitors@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: F3650DB328
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:20:46AM -0800, Harshit Mogalapalli wrote:
> Cache struct device *dev and feed it to the devm helpers to simplify
> the probe function. No functional changes.

With or without below being addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> -	ret = devm_iio_kfifo_buffer_setup(&spi->dev, indio_dev,
> +	ret = devm_iio_kfifo_buffer_setup(dev, indio_dev,
>  					  &sca3000_ring_setup_ops);

Now make it a single line, it's just 83 characters.

>  	if (ret)

-- 
With Best Regards,
Andy Shevchenko



