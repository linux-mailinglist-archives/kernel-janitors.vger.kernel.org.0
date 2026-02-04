Return-Path: <kernel-janitors+bounces-10140-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNDEGogMg2k+hAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10140-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Wed, 04 Feb 2026 10:08:24 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1838E395E
	for <lists+kernel-janitors@lfdr.de>; Wed, 04 Feb 2026 10:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E469D3143086
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Feb 2026 09:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A851039E186;
	Wed,  4 Feb 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYDyv4wR"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E8257423;
	Wed,  4 Feb 2026 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195674; cv=none; b=Kpj9Wyjf6z4yPonk73WXRN7mMRtGKRC1jSR7UP2schUx0qCm4Xj3wucwGg8XCVrzWcecmygCDkLWmf4S8dvsIgxTTuyUhoUlp/pch/KAp9Bb2TAYDEcXPAw/bx0T3sIAJQZL7+GVaWu+R2R4qbsU7E0sM10AL6TTIrpG6uhtnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195674; c=relaxed/simple;
	bh=5lSum2et6iIKwNBhoCtMoXUr71AJxzGfibwW57ZG5Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRgBRlrjBqH/wkBSwZrPcd8p6ZvDGiD8n+D99pKzVbJmaNS7NDHkdQaKdse5A2RQFoGXfNbjTxvD+8Tns77d8hBXclOK74QZPZZ0Bubv7NtbvtfnYb9i9Ex4L5nyv+WKZwgOwwC9jS5LG6yEQDm5bbN8YokpEQlDFVdURq/EyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYDyv4wR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770195673; x=1801731673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5lSum2et6iIKwNBhoCtMoXUr71AJxzGfibwW57ZG5Nw=;
  b=IYDyv4wROWhSIboF3BgZFmdah2ttDUPyMxflD1WAcW79sJCsodzXdPzv
   Be5B7NajoyW/9Cgu44G8coGvhQPluMoFEtATpEeI1IGGsnQzPJpftXT9C
   M/53hRQn/nuhgnpw69AZxc1ST80Cpmk1bp905gmbtaey6I1T4vZchM9YV
   y8fGFCn/ZK9TVmoRun+AUu6TYNzH8ppfLDm5B4kn5ZXkZbIcnsNbBpV72
   /TnJlBOEdlvrGBj1uaMc7N5I0+qPM+yNv8vZRS0clMLzpLrHHDiWpQ6lg
   nVfUkqd5a/pFijytGWXdRTouDvH7i1kBXiCea07jiyWEeY3bpGNGaPmRQ
   Q==;
X-CSE-ConnectionGUID: uxecHlURQnSP8gUcCDkanw==
X-CSE-MsgGUID: n7Zi63ONT4G3UIHkvG++FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71437491"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71437491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:01:12 -0800
X-CSE-ConnectionGUID: PmQEKuWzSYKvLbPcZ3jbMg==
X-CSE-MsgGUID: Azt2EjDTRDGgLV1KkAaGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="233034233"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:01:09 -0800
Date: Wed, 4 Feb 2026 11:01:07 +0200
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
Subject: Re: [PATCH v4 next 5/6] iio: sca3000: stop interrupts via
 devm_add_action_or_reset()
Message-ID: <aYMK06VJUrXCnNiX@smile.fi.intel.com>
References: <20260204061219.791037-1-harshit.m.mogalapalli@oracle.com>
 <20260204061219.791037-6-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204061219.791037-6-harshit.m.mogalapalli@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-10140-lists,kernel-janitors=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: C1838E395E
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:12:00PM -0800, Harshit Mogalapalli wrote:
> sca3000_stop_all_interrupts() is moved above the probe routine so the
> new function sca3000_disable_interrupts() used in probe can directly
> call it without additional declaration.
> 
> Used devm_add_action_or_reset() for shutting down the interrupts.
> Make sca3000_stop_all_interrupts() return void now that it always hooks
> into devm cleanup.
> 
> No functional change intended.

This patch overloaded by extra thing. What you should do is just move code
upper without _any_ modifications being done _before_ even patching it for
guard()(). With that additional patch the rest will look much easier to
review.

-- 
With Best Regards,
Andy Shevchenko



