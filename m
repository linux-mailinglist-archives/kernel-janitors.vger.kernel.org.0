Return-Path: <kernel-janitors+bounces-10066-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMM0GH3beWkg0QEAu9opvQ
	(envelope-from <kernel-janitors+bounces-10066-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Jan 2026 10:48:45 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D55DE9F018
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Jan 2026 10:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 477623003352
	for <lists+kernel-janitors@lfdr.de>; Wed, 28 Jan 2026 09:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7C34C990;
	Wed, 28 Jan 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqNtMTrC"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E527FB2E;
	Wed, 28 Jan 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593719; cv=none; b=LiYrOmupR+GUScjAkfv7DQpzIpHCtFUXxWX3lxnu5XKpI51lEz6LCgoZY2WkWtInRKZ08fjfbL3m32bKJ7uFf1+lI06sZ/IeVOzT8Xp5nAuDToCdCiIdmZTRRgUbxqNZYwsixJUGQN6WMQbm2m++lm4yznkWwEnwZH4jCTJ2CKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593719; c=relaxed/simple;
	bh=iosANnBACMbOlPXdyS+EjaMHVMi/d2T/ok25qXkpV+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCV7T12q40ibsRGTGZ6e7tRAYaqklFOZ6xLAIjuGGiIwI52sqeaI/mCHKrH09vRraIxNZVPc09VbFW5Je8KjgkpsXSALMsMX5fQSez3w1RZV+DIGKm6TvoylVaC/+gpziUG6IA5GPmZSUtNBHu4AJ5+KIWD1g9eryLYtAA01tJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqNtMTrC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769593719; x=1801129719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iosANnBACMbOlPXdyS+EjaMHVMi/d2T/ok25qXkpV+0=;
  b=cqNtMTrChvqyQORSIuYcO6V8nOe3JctYtWEIQGcOzfzJcI995T3X5aZN
   qkmId9gh4yTIzihQj3CU8oaVAp2nH52KakA6a9jEvcwmj+bcV68FkedTR
   O+T731pkhUS/++BzYLUrD2qLVvEe9vaMYieAf8s+88VoN2EU9oxqcXeXC
   kAGnnWkjy0zIdK5fRQqq/PbJ96wsCJcBCyt9s04RGvyaYdFnWVi4Z8ooe
   IdERDejQiawTCVKwd+ikjVa2sK67r5o1JNkxjxi+HDuOfyrNSQfgfqGzH
   ryByBRBLG3+f99cOjZu32M0KnxoQAv+JCHjeBGVALJPP3C6RzYMJ7F5Bs
   g==;
X-CSE-ConnectionGUID: nMJ2BNj7S/6RhF2AFeraBg==
X-CSE-MsgGUID: fdIy0quFQii2kZBA0tcwfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74428633"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74428633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 01:48:38 -0800
X-CSE-ConnectionGUID: bEAxZy8ORxuvFUuNrZ3yXQ==
X-CSE-MsgGUID: f/mHchBwTtaKJqiXyF36UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231178745"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 01:48:34 -0800
Date: Wed, 28 Jan 2026 11:48:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gustavo Bastos <gustavobastos@usp.br>,
	Andrew Ijano <andrew.ijano@gmail.com>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
	kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH] iio: sca3000: Fix a resource leak in sca3000_probe()
Message-ID: <aXnbcNYWaf2u9I4u@smile.fi.intel.com>
References: <20260128064953.2952714-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128064953.2952714-1-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,usp.br,gmail.com,metafoo.de,vger.kernel.org,linaro.org];
	TAGGED_FROM(0.00)[bounces-10066-lists,kernel-janitors=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[kernel-janitors];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,smile.fi.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D55DE9F018
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:49:49PM -0800, Harshit Mogalapalli wrote:
> spi->irq from request_threaded_irq() not released when
> iio_device_register() fails. Add an return value check and jump to a
> common error handler when iio_device_register() fails.

LGTM, but I would rather converting this to use managed resources.

So, if Jonathan wants to take this first,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



