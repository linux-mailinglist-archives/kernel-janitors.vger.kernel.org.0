Return-Path: <kernel-janitors+bounces-10166-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJAXGn3GhGk45QMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10166-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:34:05 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E05F5496
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B78BD30547D3
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Feb 2026 16:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6100E43900C;
	Thu,  5 Feb 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkvq60do"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB83D3488;
	Thu,  5 Feb 2026 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309021; cv=none; b=U6c3iI7TDEclRELXLAmg+70J4Ih1IbNNOkwmTymmNWDw9CI9g0YuX26QBO25V+qF92/vBxSKIhvzAscACgDPIL2KnLSmlFUfQZTtXpycMekR0ZtA2D+1MiaZUSmyVmn04b2x2SpDyuO6qOfoh6J6gQp8EzC7YUPUxgzViDaouJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309021; c=relaxed/simple;
	bh=vhWmuEznNCBRc4HTR9xoBKMUmjrJOp8UwBzP6DKHB4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVuh74En+/mdESQVKAzmwHIJeox0/T7an3Inceri18RAXWfrbs/7iszAAIjirEXJynAh/woubBitoP4yxuMij87ADPrhKAhLqWM+u2Qm383HSrvdKMG0M+wSr4ofInlZveR2lNzE2WNAEniZ3RPjutCb32Xzy1zNjJg1+MiLxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkvq60do; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770309021; x=1801845021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vhWmuEznNCBRc4HTR9xoBKMUmjrJOp8UwBzP6DKHB4U=;
  b=fkvq60doynWBEV358oKGyyohPdoM93XSp7g7G6C4qkvWdAbPIerP0Czv
   /wVy8INhEOHX3uTk9iKV6Onn18rhFdWnP2D0KPzLv4VVgPNkwT3hs59g7
   TotywBi3Mc0UKbj3zpWJ5E6fV0ht4NX2a7M1AHeZlZJNm5TZu65I1GBqN
   0cyspy/AbY5CBre77cFHCa0HW570rfR54LuOrRdQemJSQ7xyn3guOSqun
   Ydf54rzpysqc+EinFhSlN5jevgQxd9dwF3+ZhFg0AQWUR0CxJGF7SmKt1
   uTSfBEfe/fDiPd4rZ9gDPV4UyfUZgzr78m11KCoHtqKYWy4lVHFbrsJAL
   w==;
X-CSE-ConnectionGUID: z7pJaYXzTV+nxMWkGqyT1w==
X-CSE-MsgGUID: jExAIbtYTMq8s8ZmAzNrkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="94157983"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="94157983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:30:21 -0800
X-CSE-ConnectionGUID: dyMYmGtpRYe3Ck/uminDQw==
X-CSE-MsgGUID: ooMKzdQCSMqb2XgBdgFRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="210408737"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:30:18 -0800
Date: Thu, 5 Feb 2026 18:30:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Ijano <andrew.ijano@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v5 next 0/7] IIO: sca3000: devm resource management
Message-ID: <aYTFmMWCd1QHLg_a@smile.fi.intel.com>
References: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-10166-lists,kernel-janitors=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 09E05F5496
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:12:06AM -0800, Harshit Mogalapalli wrote:
> This is an attempt to update sca3000 accelerometer driver to make use
> of devm_ based helpers where needed. I have split it into 6 patches.
> 
> Patch 1 - some refactoring and simplification of dev.
> Patch 2 - switches request_threaded_irq() over to the devm helper
> {atch 3 - Move stop_all_interrupts() above probe
> Patch 4 - make stop_all_interrupts() return void
> Patch 5 - Make use of guard() in sca3000_stop_all_interrupts() function.
> Patch 6 - Used devm_add_action_or_reset() for disabling interrupts.
> (Ensured the ordering of teardown bits remain same)
> Patch 7 - manage device registration with devm helper
> 
> Yet to be addressed tasks: (Would like to take this up as a separate
> activity)
> 1. We shouldn't be using the spi_device_id at all. [Thanks to onathan
> and David]
> 2. Modernize other functions to make use of autocleanup style locking
> which simpifies the code and makes error paths cleaner.
> 
> I will be working on these two above tasks and will be sending a
> different patches for those.
> 
> The series builds cleanly and I have performed static analysis with
> smatch checker but haven't tested on actual hardware.

LGTM, but there are a couple of things I noticed while going thru the patches
again. They maybe addressed later, or if, Jonathan asks, in the next version.

-- 
With Best Regards,
Andy Shevchenko



