Return-Path: <kernel-janitors+bounces-10120-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCkYHkkTgmkgPAMAu9opvQ
	(envelope-from <kernel-janitors+bounces-10120-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:24:57 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0242DB3ED
	for <lists+kernel-janitors@lfdr.de>; Tue, 03 Feb 2026 16:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 452F2309A1DA
	for <lists+kernel-janitors@lfdr.de>; Tue,  3 Feb 2026 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D4F342CA2;
	Tue,  3 Feb 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOBSHkmr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF22853EE;
	Tue,  3 Feb 2026 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132218; cv=none; b=rTbkKJ/EKc0J3d8OjSjav5W73BcvfhMn2pl2rj7XJw8y9tEJZFFo9Axrg5+uTWImULtieFVuKz/L/6h3E31jPOC+1DsfEIAtSZQMLrQh6qJWrQB+zloZI7jOkjmB5HcEBD96VTBW3yeTKO83x06Jkcj1LxLALTTkdFC1jZShVpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132218; c=relaxed/simple;
	bh=yheFF2zcPeHF3xBsWsypbyfcaFIjy9D37ra/eO9nUZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj1tsjuO6peAkzbU/v6Q2iqlQpPpJgrQWHjtBlU5y/y7t64q4xt4C3WR3Xp63HXj6eqaZh96sLGo44L7mqINmgaTW0IHAO4y5fX+++xF52WyfaUpCFMv0Zop5ocL6xJ4J0BsGsbha1XhTRBjDa7KjiOjyUrjwS4oZiRe1DMcnvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOBSHkmr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770132218; x=1801668218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yheFF2zcPeHF3xBsWsypbyfcaFIjy9D37ra/eO9nUZ4=;
  b=SOBSHkmrrK6xyEaFD1ZzwTssenQ8YDNgHDdWTX4rYUjZL9D3fiVZcaLW
   ujMoMtz54hArjU6He9mnyCJplKWL1p0/xw6bFDD2ajr7X8KMWuZMHiZH6
   SWdpyGRrcLuVa8siw0VEbAh3+dG200boUMv/FKtg5QVJZSlrV0ehy7oha
   z5OoDOWSo2yTtVmy03Lv+yYRKrC5uu4CEkyCpIda0lZedxDQrJRdjK8tY
   vyWw9YIjTsaSvBL/TDJo5irau/ljGa5GL0Lk/nBjQKDjSXlEC4oBgOGt6
   17sjYQWUz2q83Ukr7yiO+bpOg2BvlauXxCZrKh7xQtcwl04BJwD+pvvIC
   Q==;
X-CSE-ConnectionGUID: U3hSuwVfQsOI3KM2sOPC/A==
X-CSE-MsgGUID: 5MTtLHUQSKGSCSzceiQLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82677067"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82677067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:23:37 -0800
X-CSE-ConnectionGUID: 1Xr36rZzQ0G4DosLqW/Xbw==
X-CSE-MsgGUID: iMETOh0ISgaLc30VyvRdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209994056"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:23:34 -0800
Date: Tue, 3 Feb 2026 17:23:32 +0200
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
Subject: Re: [PATCH v3 next 5/6] iio: sca3000: manage device registration
 with devm helper
Message-ID: <aYIS9E8vI_xeIst0@smile.fi.intel.com>
References: <20260203122109.689669-1-harshit.m.mogalapalli@oracle.com>
 <20260203122109.689669-6-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203122109.689669-6-harshit.m.mogalapalli@oracle.com>
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
	TAGGED_FROM(0.00)[bounces-10120-lists,kernel-janitors=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: D0242DB3ED
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:20:49AM -0800, Harshit Mogalapalli wrote:
> Convert the iio registration to use devm_* helpers so the probe no
> longer needs a separate cleanup path and remove callback can also drop
> the unregister. After this there is no need for having a remove
> callback, so remote it.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



