Return-Path: <kernel-janitors+bounces-10164-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJWnOcnFhGk45QMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10164-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:31:05 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFBDF542F
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35123027951
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Feb 2026 16:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B64B438FEB;
	Thu,  5 Feb 2026 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nun5EzRt"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3A01A9FBA;
	Thu,  5 Feb 2026 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308875; cv=none; b=H7wrebtnmufcMcE68xCYHLrJtWBFpgqpbVutNMqvmU64Rhgz0eJJiw315QSPwZEj52mZoXjS+pe4WoHvxzLcKh6M6JRve0eX5UvLfNy3+T9bet6Z0dBFs8ydcg1rp+SJ51/6vMHgtSlVOnbXsOeg8z+QHQFfX5Dqqhk+KOK0UxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308875; c=relaxed/simple;
	bh=0Yyu1hdGKAKjzTlWJgfMsyR4ay9prHT4YrVvCkPBwrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N56GY2H9B2OIKJUyfj0j/I7vJuS3WUNEPrYUzKkO9z5xtikR7EJS08+QPkeIFZZtOBM40MOA8wNwc1DZTLs84KMJ+Wa+myVggz62wNTMM1C5Odo8MD3fEmtvOUZ502u8T/YkDXr8tAJddSpER+madmDHzx1WiYSk8Cg1z4I12I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nun5EzRt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770308875; x=1801844875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Yyu1hdGKAKjzTlWJgfMsyR4ay9prHT4YrVvCkPBwrs=;
  b=Nun5EzRtG9/TrpmrdVYkgcIbICwNPOkGRJ3kgU+bclp9p66sf9/yaPIX
   Nr8tSlzpMo56URmqm1ZYhH15i1bQF5WBjjHwOfLXgnsn7Mq0ddEMUlYjr
   TEsP1A1cmB7KqChDhODFpaolSsYGUDn1d/IXf9U02Dgxe20OtJ6B7egOH
   +ly5giyHLFVlhUGKPuG3q00sS1s5/nQjSecI8nofeUVKQytk4m5zUSi8C
   F5qWzSiwxHoLsUP3x6SMUqLNrefLyyLkWirvNis0CUuHfC9GpLrW0eGQb
   9FqHzR9bPTGaJMMSlX1qeGtHoMo50iJJUaypjiTX8DtzUH1D4uSr025an
   Q==;
X-CSE-ConnectionGUID: Zqdtte51TwOlHVkaa4pWiQ==
X-CSE-MsgGUID: crHIjFhDTfWWDxBmE6iB0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71609419"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71609419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:27:55 -0800
X-CSE-ConnectionGUID: UvLZgDhaTrGxJEg4g4IuiQ==
X-CSE-MsgGUID: /VqLvh7cQMGenVGoSM4EAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="215070280"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:27:52 -0800
Date: Thu, 5 Feb 2026 18:27:50 +0200
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
Subject: Re: [PATCH v5 next 6/7] iio: sca3000: stop interrupts via
 devm_add_action_or_reset()
Message-ID: <aYTFBogrdfbWIRY3@smile.fi.intel.com>
References: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
 <20260205131234.3244467-7-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205131234.3244467-7-harshit.m.mogalapalli@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-10164-lists,kernel-janitors=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DFBDF542F
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:12:12AM -0800, Harshit Mogalapalli wrote:
> Used devm_add_action_or_reset() for shutting down the interrupts.
> Make sca3000_stop_all_interrupts() return void now that it always hooks
> into devm cleanup.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



