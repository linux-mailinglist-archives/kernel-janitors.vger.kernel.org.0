Return-Path: <kernel-janitors+bounces-10117-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILs+BKUSgmkgPAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10117-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:22:13 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E83DB398
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02A12308B54C
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Feb 2026 15:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182313B8D40;
	Tue,  3 Feb 2026 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGEQ5zaM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B855350A27;
	Tue,  3 Feb 2026 15:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132047; cv=none; b=QQLVVNTA9DNI3jodU0gx66oubJUJwAPqxx9GbFvEjSjXYyyc5rQANBThR4ObB2tg7Giq9lsOhUlCVBJSyLhXqLhTQX1KTISYbXHQKVx+enE3t7/qJuw0gXEMV7LwPF4gOYMq4YzzVZrzDgncoHyljMex9T/x06urX6rs/VowUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132047; c=relaxed/simple;
	bh=toiMCdJbIvV8wQT8bsMYnNmDzlhcit3we1a2SFcCPlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4oICDnxrRFbCUiZWPNcrpEBScv1lhZrpgTd6WyphEmkZt2vmCCAH4Ga2GlgRriQPF9dC5mjn3yZzUb17ckXYiieu/Yh3/3FWBlHkRZyAbE26seWtUvmVD19mCSOPRExvgf/f/bZ6Bc/588WvFbbGedPG6qp7KTGU1djWeuMYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGEQ5zaM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770132046; x=1801668046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=toiMCdJbIvV8wQT8bsMYnNmDzlhcit3we1a2SFcCPlg=;
  b=TGEQ5zaMFQ6btLjChlvsd0Q5Ns+0DkBsN9ey6lk2fGNH5NlTBbs7ZCEN
   8RuwPhflrQiLhS8mtK98c5+4YW+iXiGKp+jxNTA5J1B44QVDj/hs3p6jr
   cD2S8uuM3jq2kfyuBpGaMWGkO68AsyJo2TjxtNP0XXesCXnqslPPEhvAt
   08nXNiw8wdZzKE0BYXPV5ALEtcTPxy86zOehtIsOv5um6+jKE2SHcK8VW
   rQdJRl0lAfGJNFMCoAHDer0Nq81U2FABex0xPsgujJnE8jQa+9eDDq4IX
   Ss8T7R4n6EoasCwn98vUaIl99JryK1w6nrDxFD1WP/SBNsb5wytXiwKlf
   Q==;
X-CSE-ConnectionGUID: CiDOleqnRniYZNM5bgHiAA==
X-CSE-MsgGUID: FJ6fwmYPRmWq19dzCFL8wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70323243"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="70323243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:20:46 -0800
X-CSE-ConnectionGUID: 4HP01xYoTgu+eGpCYEw5qg==
X-CSE-MsgGUID: WeFV32jrQqCqUTH5GGSALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209908688"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:20:43 -0800
Date: Tue, 3 Feb 2026 17:20:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com, David Lechner <dlechner@baylibe.com>
Subject: Re: [PATCH v3 next 3/6] iio: sca3000: switch IRQ handling to devm
 helpers
Message-ID: <aYISSJLM5CxUXlQv@smile.fi.intel.com>
References: <20260203122109.689669-1-harshit.m.mogalapalli@oracle.com>
 <20260203122109.689669-4-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203122109.689669-4-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,vger.kernel.org,baylibe.com];
	TAGGED_FROM(0.00)[bounces-10117-lists,kernel-janitors=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 62E83DB398
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:20:47AM -0800, Harshit Mogalapalli wrote:
> Convert the threaded IRQ registration to devm_request_threaded_irq() so
> that the probe and remove paths can drop manual freeing of irqs.

...

>  	if (spi->irq) {


Hmm, shouldn't this be ' > 0' check?

> -		ret = request_threaded_irq(spi->irq,
> -					   NULL,
> -					   &sca3000_event_handler,
> -					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -					   "sca3000",
> -					   indio_dev);
> +		ret = devm_request_threaded_irq(dev, spi->irq, NULL,
> +						&sca3000_event_handler,
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +						"sca3000",
> +						indio_dev);
>  		if (ret)
>  			return ret;
>  	}


-- 
With Best Regards,
Andy Shevchenko



