Return-Path: <kernel-janitors+bounces-10139-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO0GIOoKg2k+hAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10139-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Wed, 04 Feb 2026 10:01:30 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25766E37A1
	for <lists+kernel-janitors@lfdr.de>; Wed, 04 Feb 2026 10:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86BC230B1891
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Feb 2026 08:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7432539E6EC;
	Wed,  4 Feb 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnI7om1A"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026939C651;
	Wed,  4 Feb 2026 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195441; cv=none; b=K9ylvDjo6EJ26Gi5ddryvrAmjYLQV8+m6LJUqyHBZM/Mf+enbpG/FwybBG6nCQRfYA7Ek+Gzs/X+QCmYS/w6GoFNCh2zrZbuf/zd2JBBPgxtr7CzI0RYJl6Acr18kW7KGyFj/m5Wzz4lnKlExUVPfa+7eWUK4CXXh77uMBouJpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195441; c=relaxed/simple;
	bh=R/18FKPIssFLZ7bGUvcCVbvXZ0peXafFPvYcY+7zXL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkKLKIcUIYnBr/HdCEMiQUw54OkvT/9ApB3J7T7cBF0w7wDcDG73J2MZjIZzJtJ04DZ4zIkjXo83KFpKvlsfu7LBV8NcTF15IUcuScikOClqvmFKeXWHdYMY4wyYtkRj1aWWKLOX/j6l2Tm71ovzH+MV1taVkTM0wTS5hQLE4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnI7om1A; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770195440; x=1801731440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R/18FKPIssFLZ7bGUvcCVbvXZ0peXafFPvYcY+7zXL8=;
  b=SnI7om1Ar+hKvmW9h3dxt9aHJCwkZ5WEBD370TTUmbkm2d7Q/A0lGLrB
   B90g2Rz9Abocx0WnIMGhxRqzGCf6gGlYNpbqyFO51DeawXpLEkCBw0Wxe
   Xo8+u2biJ2OyxaLRZEpfqnr9R8l3VqinN9rRuy+sM7r/QSA5Oonrr25F9
   zNSk6QLH7giCTkf3dwuk4vzAVQSmYyl6sCHOXs+R1/kPBS/oEyjTJF8uR
   P1peynkWgav2QL6ua45EzLnTrramFlhNrXjiZHGsRjAzp6KXxLbKVw6Ic
   Dh/r0awBay+zD/EG6f7VdlW4J41Q44P19nfW4smikM9DS6s3yrZF/Y+3P
   A==;
X-CSE-ConnectionGUID: qCk37X4DRMKiYDCtGPncWA==
X-CSE-MsgGUID: c2BvhoRrS4Wh21RKRaOBSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82746449"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82746449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:57:19 -0800
X-CSE-ConnectionGUID: KVZrg1ykQWawfDG1F4QeiA==
X-CSE-MsgGUID: qqasq5x/QBSyCxzGwHp6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209204650"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:57:16 -0800
Date: Wed, 4 Feb 2026 10:57:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Gustavo Bastos <gustavobastos@usp.br>,
	Andrew Ijano <andrew.ijano@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH v4 next 4/6] iio: sca3000: use guard(mutex) to simplify
 return paths
Message-ID: <aYMJ6h2DmfJOyQmY@smile.fi.intel.com>
References: <20260204061219.791037-1-harshit.m.mogalapalli@oracle.com>
 <20260204061219.791037-5-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204061219.791037-5-harshit.m.mogalapalli@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,usp.br,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10139-lists,kernel-janitors=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 25766E37A1
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:11:59PM -0800, Harshit Mogalapalli wrote:
> Switch sca3000_stop_all_interrupts() to use guard(mutex) to simplify the
> error paths without needing a goto.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



