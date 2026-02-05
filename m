Return-Path: <kernel-janitors+bounces-10161-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDoTN3HEhGk45QMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10161-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:25:21 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0DF52E0
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 594AA3033880
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Feb 2026 16:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC7B43637B;
	Thu,  5 Feb 2026 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLxCLx2s"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7513242CA;
	Thu,  5 Feb 2026 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308606; cv=none; b=uBoms46/WjO6AjvAJLVu6NOD5pLMaBjGDheyTl+KFL9k6SHFHB6wTTRQJ1FlGZBKrNiLQ/nII0FjkI2gslkMuRUle+FCLk2OO04gMdAadj1r36/LJf89UZBNHdiiPleugz+90qdM4DYM71HJHHW+RvGIqlQg1Rb0Yzo39ldjr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308606; c=relaxed/simple;
	bh=8U2XY50k6/W+yUqSq8a5MgIO22MPS26FrWvV9He3sA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNBI6DeiZrodTNFERkLYTQfrRQgOnYk1M6+o549jr/MCtABO2OJjAUZ67LGf2on+nfMEvWj/9Qgp5fAKs1Nv+/va9QAWdYpkkYnwVdgS+vnyJXgivf0U6OowxzsF8fJx9EdaCO1yObbjA+lG+mVs78y1HU30s+qAnXlAu/keg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLxCLx2s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770308605; x=1801844605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8U2XY50k6/W+yUqSq8a5MgIO22MPS26FrWvV9He3sA4=;
  b=XLxCLx2s49gihB4bTAaqsWJiGDvCzn3uvRwNugVMeYDACZCDe9755sCb
   DRvQCjzMC9bwHvcNcMRZT29w3KyGl01avJD85V1mkwou5+TIpRoAotb2m
   B1VgQCXT96FeTQXp1SasXHAnoKHfnKZnUOXqOyxfIRy3LkdmvUZ7SbSn2
   y6+WBqpoQ3/i5EndWSGGFsgc2rwS6d9t/v+0dk2vs/H+kvJe8SN8q9DoN
   LbpWw82VO3r7piqgRMbEB0DsNgrls2yKOu88AYLC+y5qsnDm4ywk3akZW
   HOy8NZmtTckcJYpfNS6586nnhd4jHVHYhkHx1hC8jNRMZ6cLQzgfInHJp
   A==;
X-CSE-ConnectionGUID: dCny9cz9Q8myaKsCvfiabw==
X-CSE-MsgGUID: /h4fZePiQs646KeZP9VW1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71609021"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71609021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:23:24 -0800
X-CSE-ConnectionGUID: CJmF6fy+RI+BwPh2uPgpfg==
X-CSE-MsgGUID: EaaqL/aHQ8OYGija1NjYyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="241254736"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:23:22 -0800
Date: Thu, 5 Feb 2026 18:23:19 +0200
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
Message-ID: <aYTD96nmDAEZd-a8@smile.fi.intel.com>
References: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
 <20260205131234.3244467-3-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205131234.3244467-3-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10161-lists,kernel-janitors=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 3CC0DF52E0
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:12:08AM -0800, Harshit Mogalapalli wrote:
> Convert the threaded IRQ registration to devm_request_threaded_irq() so
> that the probe and remove paths can drop manual freeing of irqs.
> 
> No functionality change.

...

> -error_free_irq:
> -	if (spi->irq)
> -		free_irq(spi->irq, indio_dev);
> -
> -	return ret;

...

> -	if (spi->irq)
> -		free_irq(spi->irq, indio_dev);

Do we need an irq member to be in the struct after this patch?

-- 
With Best Regards,
Andy Shevchenko



