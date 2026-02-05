Return-Path: <kernel-janitors+bounces-10169-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFxEBDnJhGk45QMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10169-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:45:45 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C313F5688
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F973300DE26
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Feb 2026 16:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B0C2EB5BA;
	Thu,  5 Feb 2026 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9hvD1/t"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECB22339;
	Thu,  5 Feb 2026 16:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309935; cv=none; b=PqCAzebRXt1gXNZhOo7CeL1SZqfQ9Y8xeAtt9/oPl1MdwstjPhpQkK1rfQCcZwuT1kZGMkV4mlj7hpjeOqlygFmmpy2ypXzf5AjvZ+9/VnmOMoqvVeYiZVH8kwycZy57/pncCg5PXHGqscHPN8Jv+jmkd66Gk3BqN+oSfNJMSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309935; c=relaxed/simple;
	bh=+CdR7l0eCK8VY1ZLwv8jpECOhBY9KDzZrz9oE9MCG3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDpS5IBsibOP0rwLf6jNSJtd9Te+kN3Mudj4SVdbxWgiJZRxD5c2t2ufh7p3fWtnux33EUAVR1ZRgLrrc4NWj8w0Dq/ZNv1Q3sS29/Qci3twmRnqqQ78FOdZgAjJDhQm6sPbv5yXiohKXHy0/CAjMyHrX1dxcvP+/YX5E2ZIjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9hvD1/t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770309935; x=1801845935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+CdR7l0eCK8VY1ZLwv8jpECOhBY9KDzZrz9oE9MCG3s=;
  b=Y9hvD1/tKqHL1U7yzxtEhofF/w7oh9SzUJ7O8dZEhAWHNoCByadh620J
   xuob5N2dfz1SBs1Kczv6jkkgttquGwOOeAkql4nOJGw2u87GiehRoXtTX
   ljV9V+QKkfD57nrKKO2Z9+27VcE/u/wxKu1o9cgKfI4GR3Mhv7bdG2Thw
   261Zmio/NPuZ5y7piAgMtmLGXtrmNqiYXipXTUjzYWY3GQZDI02oiJK7n
   WEEIBXDDz5fguydB/jhLUg+fBXgDQ31NTRHy3YCAgkhZI4ts9KztfV2TA
   9tWcpc0v5/VHHf08Ck808xH9i0Z6Ec3dSQBkvB1m1UP0JdjQ0/Somev/+
   Q==;
X-CSE-ConnectionGUID: CTF1N2l2Roml+/mFhFQP2A==
X-CSE-MsgGUID: t89wpo9xRoWyjxuEsEgwgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="88935698"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="88935698"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:45:34 -0800
X-CSE-ConnectionGUID: bxwqhQTARK63N4/2t/w17w==
X-CSE-MsgGUID: WgpO+HDyTAyZSBKHBozS2w==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:45:31 -0800
Date: Thu, 5 Feb 2026 18:45:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5 next 2/7] iio: sca3000: switch IRQ handling to devm
 helpers
Message-ID: <aYTJKaSt6WkMRIJY@smile.fi.intel.com>
References: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
 <20260205131234.3244467-3-harshit.m.mogalapalli@oracle.com>
 <aYTD96nmDAEZd-a8@smile.fi.intel.com>
 <88524db5-cda6-4529-83db-54ff3b3d5819@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88524db5-cda6-4529-83db-54ff3b3d5819@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-10169-lists,kernel-janitors=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 6C313F5688
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 10:09:45PM +0530, Harshit Mogalapalli wrote:
> On 05/02/26 21:53, Andy Shevchenko wrote:
> > On Thu, Feb 05, 2026 at 05:12:08AM -0800, Harshit Mogalapalli wrote:

...

> > > -	if (spi->irq)
> > > -		free_irq(spi->irq, indio_dev);
> > 
> > Do we need an irq member to be in the struct after this patch?
> 
> I probably didn't understand that question fully.
> 
> we still have a call to ret = devm_request_threaded_irq(dev, spi->irq,
> NULL,...) so we can't relaly get rid of the irq member I think,
> did I understand your question right ?

Yes. But now I realised that this is the external structure, and not the one
the driver defines. Sorry for the noise.

-- 
With Best Regards,
Andy Shevchenko



