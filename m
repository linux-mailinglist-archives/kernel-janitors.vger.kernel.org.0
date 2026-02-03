Return-Path: <kernel-janitors+bounces-10121-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEJmHU8TgmkgPAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10121-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:25:03 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D7DB3FC
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ED70303EF92
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Feb 2026 15:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745F73B8D48;
	Tue,  3 Feb 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajg9p0+z"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF032741A0;
	Tue,  3 Feb 2026 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132299; cv=none; b=QlEUjheK9UoL/0lvVwcZTtOjB9/TOqBDJAl4FvlgaBdgOo1gtOK1LR7ibWHHyy9411tLKSjzPaQlwpJ5LqaAdhG7Hk4Hsa1DpQCE7wFttl9i47oj8EP3rpCcgbZFqvS0yVYhh8mg7i9E4TJsB4z58A5RFF67d02+OM/ARH12qf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132299; c=relaxed/simple;
	bh=rHosglRelEy3BJW2PR4KZp3/Lc98RditfRLWqURCJwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfxivlqDhZAo0QWTBm0sCAXf6IpJNEbkoX56E39+L5SCYzg/N9AoqlKdXdMmf5lYGdZ0iBSo67/aoyHwIc4vPSW7FQYk+Va6NnUqbeGvbgimiamTU0/z6oBmYJmPUYDctO8c9GToDPQwQKiNqWPKLWtg9pfseUAFzk6Uu5RPuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajg9p0+z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770132299; x=1801668299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHosglRelEy3BJW2PR4KZp3/Lc98RditfRLWqURCJwM=;
  b=ajg9p0+zl44qSu6vHRznXIILQcsx0dM2aIRSiJnMDjnwklRUy22wkyAx
   wFTIWgcMUJYHG8Dja63OaVduVtHN0d9GzpbreIiX6SasizGkKwEEUZgbv
   kfNDokXj58x8daB8MwTAG1BA0VsqTeGPMbfzDKD6jUseEbFCqtrezgLbE
   Fn7OV39JjV1vk5r8Ziq+PdoTKdRSlsbRJbFCjDPTrwoTxqnWCN29BaZaA
   GLSKV2WgFLGKgwn9BiNqpCngQVvjMfQa/prOHbSBx3cqZTAP6jHrZDmkR
   xT7cJN+soV8gnPFW7DYUj7YS//bT1BVL58ph5qQlczQy4QAIAmHxN7Jcc
   A==;
X-CSE-ConnectionGUID: dH1s3deRQneV8BPPqv+Ayw==
X-CSE-MsgGUID: /fHFNv0BR82F5DO5OPL3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71285722"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71285722"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:24:59 -0800
X-CSE-ConnectionGUID: v7DghfIcQGqLYRjbP4IMHQ==
X-CSE-MsgGUID: 4rYT4n82QYKFPzjAumlSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="210025691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:24:55 -0800
Date: Tue, 3 Feb 2026 17:24:52 +0200
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
Subject: Re: [PATCH v3 next 4/6] iio: sca3000: stop interrupts via
 devm_add_action_or_reset()
Message-ID: <aYITRNfRgK475ck-@smile.fi.intel.com>
References: <20260203122109.689669-1-harshit.m.mogalapalli@oracle.com>
 <20260203122109.689669-5-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203122109.689669-5-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,vger.kernel.org,baylibe.com];
	TAGGED_FROM(0.00)[bounces-10121-lists,kernel-janitors=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF7D7DB3FC
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:20:48AM -0800, Harshit Mogalapalli wrote:
> sca3000_stop_all_interrupts() is moved above the probe routine so the
> new function sca3000_disable_interrupts() used in probe can directly
> call it without additional declaration.
> 
> Used devm_add_action_or_reset() for shutting down the interrupts.
> Make sca3000_stop_all_interrupts() return void now that it always hooks
> into devm cleanup.
> 
> No functional change intended.

...

> +	mutex_lock(&st->lock);

> +out_unlock:
> +	mutex_unlock(&st->lock);

You copy the code that is going to be removed. It means the conversion to
guard()() should be done before this patch.

-- 
With Best Regards,
Andy Shevchenko



