Return-Path: <kernel-janitors+bounces-10160-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH8qMj3EhGk45QMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10160-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:24:29 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC8F52C8
	for <lists+kernel-janitors@lfdr.de>; Thu, 05 Feb 2026 17:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D124430293F5
	for <lists+kernel-janitors@lfdr.de>; Thu,  5 Feb 2026 16:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDF3288B8;
	Thu,  5 Feb 2026 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ4aIcL5"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBE436361;
	Thu,  5 Feb 2026 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308547; cv=none; b=TFNbvw9I7DEHGgHrbUxMLxmx6H8lNSzWW1oxS3NaPWbubzTOw+T0GoKER1ZuWPYxrBQlyMkNcJVKpHWwOfi4Y8Lru9wEbS1xRdwZH+H9Jsg1oUXUPheRuaymNojkejfko2vikpN9mk/SFBm+HmTyZ7ku8Kj+ogagdr04yZ42xkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308547; c=relaxed/simple;
	bh=E4auTjfemShcMXyPT4oMBJTQnZOBAXEc51ijPSDXeh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+Ez3c/pd1jvlk4+7iq1u/imRitvFkA4NPuM7kvN464RL8CM+oe69jARcFAJpfQpS6/r+SqjiAQPzpQGg4xU/cPUE5xRiQrx+wStqgySDXD4Kzz/soTjcqyVhazNcxVzW77HLpXhpEg4rUVVcJlxmfwbWc/JMStoprXh99Z+Aqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ4aIcL5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770308547; x=1801844547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4auTjfemShcMXyPT4oMBJTQnZOBAXEc51ijPSDXeh4=;
  b=cZ4aIcL5/H4QfSXR9Y18HUy7u5g1L/z+ameWvLTP0sQATqoD6wKPhELR
   pylGiJUm9lRk7BaQuOmsj5SW7WpK9AID9v+/8S4k+rfXR7N4PGsOkS7ER
   u2K3OJy8Sy0Mx5Dn9LRAW9jsUX2YGg9a9YfmbQatDbZ30AxhWQCXs/43U
   AqnIqEd/7ewkh5C8QKTeZXHQkmD1x8ga3GkuHyttSeDDypK21qk0Q/0h5
   S6LCqZjYywaTWxDct1jiqyGCdPhdNlFNm30uBEa3RSJNWsrDIOhm82I/M
   x4rScxLJWjz+WMtagEDaTcoh9IRu2I1+yRNhim1yDt0gKER7RVaU/h+T0
   Q==;
X-CSE-ConnectionGUID: BOQEGH/IQNegJ+4jNU5k6Q==
X-CSE-MsgGUID: p8Q06kY9QuiBq0OrHt6XxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="96965969"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="96965969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:22:26 -0800
X-CSE-ConnectionGUID: kJPb7iiYTN6trIyavuUd4Q==
X-CSE-MsgGUID: J8wC9gSWQ6Wd6VQs0cDDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="210487010"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:22:23 -0800
Date: Thu, 5 Feb 2026 18:22:21 +0200
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
Subject: Re: [PATCH v5 next 3/7] iio: sca3000: Move
 sca3000_stop_all_interrupts() above sca3000_probe()
Message-ID: <aYTDvQ3qO8KW7dr-@smile.fi.intel.com>
References: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
 <20260205131234.3244467-4-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205131234.3244467-4-harshit.m.mogalapalli@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-10160-lists,kernel-janitors=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47EC8F52C8
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:12:09AM -0800, Harshit Mogalapalli wrote:
> Move sca3000_stop_all_interrupts() above sca3000_probe() without
> altering its logic so the next set of patches are easier to review.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



